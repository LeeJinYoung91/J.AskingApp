//
//  TabViewController.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 29/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit
import FoldingTabBar
import SideMenu

class TabViewController: YALFoldingTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupYALTabBarController()
        setUpSideMenu()
    }
    
    func setupYALTabBarController() {
        let item1 = YALTabBarItem(itemImage: UIImage(named: "icon_write"), leftItemImage: UIImage(named: "icon_list"), rightItemImage: UIImage(named: "icon_chat"))
        let item2 = YALTabBarItem(itemImage: UIImage(named: "icon_notice"), leftItemImage: UIImage(named: "icon_list"), rightItemImage: UIImage(named: "icon_chat"))
        item1.leftHighlightedImage = UIImage(named: "icon_list_sel")
        item1.rightHighlightedImage = UIImage(named: "icon_chat_sel")
        item2.leftHighlightedImage = UIImage(named: "icon_list_sel")
        item2.rightHighlightedImage = UIImage(named: "icon_chat_sel")
        leftBarItems = [item1]
        rightBarItems = [item2]
        
        centerButtonImage = UIImage(named:"icon_plus")!
        selectedIndex = 0
        
        tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
        tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset
        
        tabBarView.backgroundColor = UIColor(red: 248/255.0, green: 248/255.0, blue: 248/255.0, alpha: 1)
        tabBarView.tabBarColor = UIColor.clear
        
        tabBarViewHeight = YALTabBarViewDefaultHeight;
        tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
        tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
    }
    
    private func setUpSideMenu() {
        SideMenuManager.defaultManager.menuRightNavigationController = storyboard?.instantiateViewController(withIdentifier: "chatNAV") as? UISideMenuNavigationController
        SideMenuManager.defaultManager.menuLeftNavigationController = storyboard?.instantiateViewController(withIdentifier: "sideMenuNav") as? UISideMenuNavigationController
    }
}
