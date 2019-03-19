//
//  MainLoadingViewController.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 08/11/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit
import FirebaseAuth

class MainLoadingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        checkHasPreviousLoginInfo()
    }
    
    private func checkHasPreviousLoginInfo() {
        
        
        AccountManager.instance.checkFacebookLoginInfo(listener: { [weak self] (has) in
            if has {
                self?.navigationController?.moveToMainPage()
            } else {
                self?.navigationController?.moveToLoginPage()
            }
        })
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
