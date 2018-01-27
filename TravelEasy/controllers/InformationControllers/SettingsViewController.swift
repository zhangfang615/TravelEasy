//
//  SettingsViewController.swift
//  爱游
//
//  Created by Fang Zhang on 2017/12/29.
//  Copyright © 2017年 Fang Zhang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var settingV = SettingsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        settingV = SettingsView(frame: CGRect( x:0,y:0,width:375,height:667))
        // Do any additional setup after loading the view.
        self.settingV.logoutButton.addTarget(self, action: #selector(logout(button:)), for: .touchDown)
        self.view.addSubview(settingV)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func logout(button : UIButton){
        logoutUserDefaults()
        logoutTravelEasyUser()
    }
    
    func logoutUserDefaults() {
        UserDefaults.standard.removeObject(forKey: "TravelEasyPassword")
        UserDefaults.standard.removeObject(forKey: "TravelEasyToken")
    }
    
    func logoutTravelEasyUser() {
        travelEasyUser.setToken(userToken: nil)
        travelEasyUser.isLogin = false
        self.navigationController?.popViewController(animated: true)
    }
}
