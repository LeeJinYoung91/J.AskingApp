//
//  ChatCell.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 30/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

class ChatCell: ChatResizingCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var regitDate: UILabel!
    
    func bindData(_ data:ChatData) {
        userImage.image = data.userImage
        chatLabel.text = data.chat
        regitDate.text = data.regitDate
    }
}
