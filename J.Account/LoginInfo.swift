//
//  LoginInfo.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 09/11/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation

class LoginInfo: NSObject {
    private var userName:String?
    var UserName:String {
        return userName!
    }
    private var userEmail:String?
    var UserEmail:String {
        return userEmail!
    }
    
    private var userId:String?
    var UserId:String {
        return userId!
    }
    
    private var ignoreList:NSMutableArray?
    var IngoreChannelList:NSMutableArray {
        return ignoreList!
    }
    
    init(name:String?, email:String?, id:String?) {
        userName = name
        userEmail = email
        userId = id
    }
    
    func initalizeIgnoreList(listener:(()->Void)?) {
        UserUtility().getIgnoreChannelList { (list) in
            if self.ignoreList == nil {
                self.ignoreList = NSMutableArray()
            }
            for channelId in list {
                self.ignoreList?.add(channelId)
            }
            listener!()
        }
    }
    
    func setUserName(_ name:String?) {
        userName = name
    }
    
    func setUserEmail(_ email:String?) {
        userEmail = email
    }
    
    func setUserId(_ id:String?) {
        userId = id
    }
    
    func addIgnoreChannelList(_ channelId: String) {
        ignoreList?.add(channelId)
        updateChannelIgnoreList()
    }
    
    func removeIgnoreChannel (_ channelId: String) {
        ignoreList?.remove(channelId)
        updateChannelIgnoreList()
    }
    
    private func updateChannelIgnoreList() {
        UserUtility().updateUserInfo(self)
    }
}
