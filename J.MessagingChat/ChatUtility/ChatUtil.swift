//
//  ChatUtil.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 31/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import MessageKit
import FirebaseFirestore

class ChatUtil: NSObject {
    static let instance:ChatUtil = ChatUtil()
    private let store = Firestore.firestore()
    
    func createNewChannel(channelName:String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd hh:mm:ss"
        let document = store.collection("channel").document()
        document.setData([
            "name":channelName,
            "update":formatter.string(from: Date()),
            "id":document.documentID
            ])
    }
    
    func getChannelList(_ listener:(([(String, String, String)]) -> ())?) {
        store.collection("channel").addSnapshotListener { (snapShot, error) in
            if let documents = snapShot?.documents {
                var list:[(String, String, String)] = [(String, String, String)]()
                for doc in documents {
                    list.append((doc.data()["name"] as! String, doc.data()["update"] as! String, doc.data()["id"] as! String))
                }
                if list.count != 0 {
                    listener!(list)
                }
            }
        }
    }
    
    func sendMessage(channelId:String, message:MessagingData) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd hh:mm:ss"
        store.collection("channel").document(channelId).collection("thread").addDocument(data: [
            "content":message.content ?? "empty",
            "regist_date":formatter.string(from: Date()),
            "user_id":message.senderId ?? "empty",
            "user_name":message.senderName ?? "empty"
            ])
    }
}
