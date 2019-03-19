//
//  UIViewControllExtension.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 30/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit
import FoldingTabBar
import SideMenu

extension UIViewController: YALTabBarDelegate {
    public func tabBarDidSelectExtraLeftItem(_ tabBar: YALFoldingTabBar) {

    }
    
    public func tabBarDidSelectExtraRightItem(_ tabBar: YALFoldingTabBar) {
        guard let rightNavigationController = SideMenuManager.defaultManager.menuRightNavigationController else {
            return
        }
        
        SideMenuManager.default.menuRightSwipeToDismissGesture = nil
        SideMenuManager.default.menuPresentMode = .menuDissolveIn
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
        SideMenuManager.default.menuWidth = UIScreen.main.bounds.width
        present(rightNavigationController, animated: true, completion: nil)
    }
}

extension UIViewController: UISideMenuNavigationControllerDelegate {
    
    public func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
    }
    
    public func sideMenuDidDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        if let navigationVC = menu.viewControllers.first as? UINavigationController {
            navigationVC.popToRootViewController(animated: false)
        }
    }
}

extension UIViewController {
    func onClickMenuList() {
        guard let leftNavigationController = SideMenuManager.defaultManager.menuLeftNavigationController else {
            return
        }
        
        SideMenuManager.defaultManager.menuPresentMode = .menuSlideIn
        SideMenuManager.defaultManager.menuAnimationBackgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        SideMenuManager.defaultManager.menuFadeStatusBar = false
        SideMenuManager.defaultManager.menuWidth = UIScreen.main.bounds.width * 4/5
        present(leftNavigationController, animated: true, completion: nil)
    }    
    
    func afterLogout() {
        UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginVC"))
    }
    
    func forceMoveToMainPage() {
        self.dismiss(animated: false, completion: nil)
        UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "mainTabbar")
    }
}
