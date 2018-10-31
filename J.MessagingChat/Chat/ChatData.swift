//
//  ChatData.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 30/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

struct ChatData {
    var userImage:UIImage?
    var userName:String?
    var chat:String?
    var regitDate:String?
    
    init(user:UIImage, name:String?, text:String, date:String?) {
        userImage = user
        userName = name
        chat = text
        regitDate = date
    }
}

struct ChannelData {
    var channelName:String?
    var updateDate:String?
    var channelId:String?
    
    init(name:String?, update:String?, id:String?) {
        channelName = name
        updateDate = update
        channelId = id
    }
}

struct MessagingData {
    let senderName:String?
    let senderId:String?
    let regitDate:String?
    var content:String?
    
    init(text:String?) {
        senderName = AccountManager.instance.userName
        senderId = AccountManager.instance.userId
        content = text
        regitDate = "지금"
    }
}
