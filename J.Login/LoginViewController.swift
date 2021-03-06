//
//  LoginViewController.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 02/11/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth
import AudioToolbox

class LoginViewController: UIViewController, LoginButtonDelegate  {
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var facebookLoginButton: FBLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLoginButtons()
        navigationController?.isNavigationBarHidden = true
    }
    
    private func initializeLoginButtons() {
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        facebookLoginButton.permissions = ["public_profile", "email"]
        facebookLoginButton.delegate = self
    }
    
    @IBAction func onClickLoginButton(_ sender: Any) {
        if let emailText = loginEmailTextField.text, !emailText.isEmpty, let passwordText = loginPasswordTextField.text, !passwordText.isEmpty {
            AccountManager.instance.tryLoginInFirebaseAuth(email: emailText, password: passwordText) { (success) in
                if success {
                    self.navigationController?.moveToMainPage()
                }
            }
        }
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        guard error == nil else {
            return
        }
        guard let token = AccessToken.current?.tokenString else {
            return
        }
        AccountManager.instance.tryLoginInFirebaseAuth(FacebookAuthProvider.credential(withAccessToken: token)) { (success) in
            if success {
                self.navigationController?.moveToMainPage()
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        AccountManager().processOnLogout(listener: {_ in })
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
