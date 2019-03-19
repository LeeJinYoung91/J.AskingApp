//
//  MenuCell.swift
//  J.AskingApp
//
//  Created by JinYoung Lee on 08/11/2018.
//  Copyright © 2018 JinYoung Lee. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {
    @IBOutlet weak var menuName:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindMenuName(_ name:String?) {
        menuName.text = name
    }
    
    func onHighlighted(isHighlighted:Bool) {
        menuName.alpha = isHighlighted ? 0.5 : 1
    }
}
