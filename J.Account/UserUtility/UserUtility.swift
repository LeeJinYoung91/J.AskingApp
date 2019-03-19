//
//  UserUtility.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 20/11/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import FirebaseFirestore

class UserUtility: NSObject {
    private final let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String

    func updateUserInfo(_ userInfo:LoginInfo) {
        Firestore.firestore().collection(appName).document(appName).collection("user_channel_ignore_list").document(AccountManager.instance.UserProfile.UserEmail)
            .setData(["ignore_channel_list":AccountManager.instance.UserProfile.IngoreChannelList], merge: true)
    }
    
    func getIgnoreChannelList(listener:@escaping (([String])->Void)) {
        Firestore.firestore().collection(appName).document(appName).collection("user_channel_ignore_list").document(AccountManager.instance.UserProfile.UserEmail)
            .addSnapshotListener { (snapshot, error) in
                if let ignoreChannelList = snapshot?.data()?["ignore_channel_list"] as? [String] {
                    listener(ignoreChannelList)
                }
        }
    }
}
