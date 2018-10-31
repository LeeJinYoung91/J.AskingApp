//
//  TabbarSideViewControllerExtension.swift
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
        
        SideMenuManager.defaultManager.menuPresentMode = .menuDissolveIn
        SideMenuManager.defaultManager.menuAnimationBackgroundColor = UIColor.clear
        SideMenuManager.defaultManager.menuWidth = UIScreen.main.bounds.width
        present(rightNavigationController, animated: true, completion: nil)
    }
}

extension UIViewController: UISideMenuNavigationControllerDelegate {
    
    public func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
    }
    
    public func sideMenuWillDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        
    }
}
