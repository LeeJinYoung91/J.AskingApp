//
//  ChatViewController.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 30/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private final let Side_Margin:CGFloat = 20.0
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        setUpCollectionView()
    }
    
    private func initializeUI() {
        sendButton.layer.masksToBounds = true
        sendButton.layer.cornerRadius = sendButton.bounds.width / 4
    }
    
    private func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: ChatCell?
        if indexPath.row % 2 == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chat_me", for: indexPath) as? ChatCell
            cell?.bindData(ChatData(user: UIImage(named:"icon_userImage")!, text: "안녕하세요.", date:"1시간전"))
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chat_other", for: indexPath) as? ChatCell
            cell?.bindData(ChatData(user: UIImage(named:"icon_userImage")!, text: "안녕하세요.\n안녕하세요.\n안녕?", date:"방금"))
        }
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    @IBAction func onClickSend(_ sender: Any) {
    }
}
