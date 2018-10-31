//
//  ChatViewController.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 30/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private final let Side_Margin:CGFloat = 20.0
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    private var channelData:ChannelData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        setUpTableView()
        setNavigationItem()
    }
    
    func setChannelData(_ data:ChannelData) {
        channelData = data
    }
    
    private func setNavigationItem() {
        navigationItem.title = channelData?.channelName
    }
    
    private func initializeUI() {
        sendButton.layer.masksToBounds = true
        sendButton.layer.cornerRadius = sendButton.bounds.width / 4
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ChatCell?
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "chat_me", for: indexPath) as? ChatCell
            cell?.bindData(ChatData(user: UIImage(named:"icon_userImage")!, name:"hello", text: "안녕하세요.", date:"1시간전"))
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "chat_other", for: indexPath) as? ChatCell
            cell?.bindData(ChatData(user: UIImage(named:"icon_userImage")!, name:"jinyoung", text: "안녕하세요.\n안녕하세요.\n안녕?", date:"방금"))
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    @IBAction func onClickSend(_ sender: Any) {
        ChatUtil.instance.sendMessage(channelId: (channelData?.channelId)!, message: MessagingData(text: textField.text))
    }
}
