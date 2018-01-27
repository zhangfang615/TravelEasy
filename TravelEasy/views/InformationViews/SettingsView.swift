//
//  SettingsView.swift
//  TravelEasy
//
//  Created by Fang Zhang on 2018/1/26.
//  Copyright © 2018年 Fang Zhang. All rights reserved.
//

import Foundation
import UIKit

class SettingsView : UIView {
    var logoutButton : UIButton!
    
    override init(frame : CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        createLogoutButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLogoutButton() {
        logoutButton = UIButton()
        
        logoutButton.setTitle("退出登录", for:.normal)
        
        logoutButton.frame = CGRect(x: 20, y: 540, width: 335, height: 40)
        
        logoutButton.backgroundColor = UIColor.gray
        
        self.addSubview(logoutButton)
    }
}
