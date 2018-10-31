//
//  ChatListCell.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 31/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

class ChatListCell: UITableViewCell {
    @IBOutlet weak var userImage:UIImageView!
    @IBOutlet weak var chatText:UILabel!
    @IBOutlet weak var regitDate:UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        backView.layer.cornerRadius = 7
        backView.layer.masksToBounds = true
    }
    
    func bindData(_ data:ChatData) {
        userImage.image = data.userImage
        chatText.text = data.chat
        regitDate.text = data.regitDate
    }
}
