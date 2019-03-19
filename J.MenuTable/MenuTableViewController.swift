//
//  MenuTableViewController.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 08/11/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class MenuTableViewController: UITableViewController {
    enum MenuType {
        case Setting
        case Logout
    }
    
    struct Menu {
        var menuName:String?
        var type:MenuType?
        
        init(name:String?, menutype:MenuType) {
            menuName = name
            type = menutype
        }
    }
    
    var menuList:[Menu] = [Menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeMenuList()
        tableView.reloadData()
    }
    
    private func initializeMenuList() {
        menuList.append(Menu(name: "Settings", menutype:MenuType.Setting))
        menuList.append(Menu(name: "Logout", menutype:MenuType.Logout))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuCell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.bindMenuName(menuList[indexPath.row].menuName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell:MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        cell.onHighlighted(isHighlighted: true)
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell:MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        cell.onHighlighted(isHighlighted: false)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if menuList[indexPath.row].type == MenuType.Logout {
            AccountManager.instance.processOnLogout { [weak self](success) in
                if success {
                    self?.dismiss(animated: false, completion: {
                        self?.afterLogout()
                    })
                }
            }
        }
    }
}
