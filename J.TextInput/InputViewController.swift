//
//  InputViewController.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 29/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class InputViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var inputBodyTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        createNavigationItem()
    }
    
    private func createNavigationItem() {
        navigationItem.createListNavigationItemBar(target: self, action: #selector(onClickList))
        navigationItem.title = "Input"
    }
    
    private func initializeUI() {
        sendButton.layer.masksToBounds = true
        sendButton.layer.cornerRadius = sendButton.bounds.width / 4
        
        inputBodyTextView.clipsToBounds = true
        inputBodyTextView.layer.borderWidth = 1
        inputBodyTextView.layer.cornerRadius = 8
        inputBodyTextView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 0.8).cgColor        
    }
    
    @IBAction func onClickSend(_ sender: Any) {
        
    }
    
    @objc func onClickList() {
        onClickMenuList()
    }
}
