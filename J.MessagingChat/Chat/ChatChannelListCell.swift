//
//  ChatChannelListCell.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 31/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

class ChatChannelListCell: UITableViewCell {
    @IBOutlet weak var channelName:UILabel!
    @IBOutlet weak var updateDate:UILabel!
    @IBOutlet weak var backView: UIView!
    private var chData:ChannelData?
    var ChannelData:ChannelData {
        return chData!
    }
    
    override func awakeFromNib() {
        backView.layer.cornerRadius = 7
        backView.layer.masksToBounds = true
    }
    
    func bindData(_ data:ChannelData) {
        chData = data
        channelName.text = data.channelName
        updateDate.text = data.updateDate
    }
}
