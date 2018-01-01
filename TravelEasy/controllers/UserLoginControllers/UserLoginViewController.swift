//
//  UserLoginViewController.swift
//  TravelEasy
//
//  Created by Fang Zhang on 2017/12/30.
//  Copyright © 2017年 Fang Zhang. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {
    
    var codeV = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        self.view.backgroundColor = UIColor.white
        codeV = LoginView(frame: CGRect( x:0,y:0,width:375,height:667))
        codeV.nameTextfiled.delegate = self as? UITextFieldDelegate
        codeV.passworkTextfiled.delegate = self as? UITextFieldDelegate
        codeV.loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        
        codeV.register.addTarget(self, action: #selector(registerEvent(textFd:)), for: .touchUpInside)
        
        self.view.addSubview(codeV)
        // Do any additional setup after loading the view.
    }
    
    @objc func loginEvent () {
        self.navigationController?.popViewController(animated: true)
        isLogin = true
        print("==========")
    }
    
    @objc func registerEvent(textFd :UITextField )   {
        
        print("------------")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
