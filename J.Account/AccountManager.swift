//
//  AccountManager.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 31/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import FirebaseAuth
import FBSDKLoginKit

class AccountManager: NSObject {
    static let instance:AccountManager = AccountManager()
    private var userProfile:LoginInfo?
    var UserProfile:LoginInfo {
        return userProfile!
    }
    
    func checkPreviousEmailLoginInfo(listener:@escaping (_ has:Bool)-> ()) {
        if let user = Auth.auth().currentUser {
            saveUserProfile(user, listener: nil)
            return
        }
        
        listener(false)
    }
    
    func checkFacebookLoginInfo(listener:@escaping (_ has:Bool)-> ()){
        if let token = FBSDKAccessToken.current()?.tokenString {
            tryLoginInFirebaseAuth(FacebookAuthProvider.credential(withAccessToken: token), listener: listener)
            return
        }
        
        listener(false)
    }
    
    func tryLoginInFirebaseAuth(_ creditional: AuthCredential, listener:@escaping (_ has:Bool)-> ()) {
        Auth.auth().signInAndRetrieveData(with: creditional) { (authResult, error) in
            guard error == nil else {
                FBSDKLoginManager.init().logOut()
                listener(false)
                return
            }
            self.saveUserProfile(authResult?.additionalUserInfo?.profile, listener: {
                listener(true)
            })
        }
    }
    
    func tryLoginInFirebaseAuth(email:String, password:String, listener:@escaping (_ has:Bool)-> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard error == nil else {
                listener(false)
                return
            }
            self.saveUserProfile(authResult?.user, listener: {
                listener(true)
            })
        }
    }
    
    func tryRegister(email:String, nickname:String, password:String, listener:@escaping (_ success:Bool) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            guard error == nil else {
                listener(false)
                return
            }
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = nickname
            changeRequest?.commitChanges(completion: { (error) in
                guard error == nil else {
                    listener(false)
                    return
                }
                listener(true)
            })
        }
    }
    
    func processOnLogout(listener:@escaping(_ success:Bool)->()) {
        FBSDKLoginManager.init().logOut()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            clearSavedUserProfile()
            listener(true)
        } catch _ as NSError {
            listener(false)
        }
    }
    
    func saveUserProfile(_ profile:[String:NSObject]?, listener:(()->Void)?) {
        guard let uProfile = profile else {
            return
        }
        userProfile = LoginInfo(name: uProfile["name"] as? String, email: uProfile["email"] as? String, id: uProfile["id"] as? String)
        userProfile?.initalizeIgnoreList(listener: listener)
    }
    
    func saveUserProfile(_ user:User?, listener:(()->Void)?) {
        guard let loginedUser = user else {
            return
        }
        userProfile = LoginInfo(name: loginedUser.displayName, email: loginedUser.email, id: loginedUser.providerID)
        userProfile?.initalizeIgnoreList(listener: listener)
    }
    
    private func clearSavedUserProfile() {
        userProfile = nil
    }
}
