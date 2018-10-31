//
//  ChatViewController.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 30/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

class ChatListViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ChatListCell = tableView.dequeueReusableCell(withIdentifier: "chatListCell", for: indexPath) as! ChatListCell
        cell.bindData(ChatData(user: UIImage(named: "icon_userImage")!, text: "안녕하세요\n안녕하세요\n안녕하세요\n안녕하세요", date: "1시간 전"))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}


