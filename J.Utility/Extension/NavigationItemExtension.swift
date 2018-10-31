//
//  NavigationItemExtension.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 30/10/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationItem {
    func createListNavigationItemBar(target: Any?, action: Selector?) {
        leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_menu"), style: .plain, target: target, action: action)
    }
}
