//
//  NavigationControllerExtension.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 08/11/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    func moveToLoginPage() {
        setViewControllers([(UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginVC"))], animated: true)
    }
    
    func moveToMainPage() {
        setViewControllers([(UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainTabbar"))], animated: true)
    }
}
