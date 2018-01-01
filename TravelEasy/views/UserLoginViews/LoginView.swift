//
//  LoginView.swift
//  TravelEasy
//
//  Created by Fang Zhang on 2017/12/31.
//  Copyright © 2017年 Fang Zhang. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    
    
    var nameTextfiled :UITextField!
    
    var passworkTextfiled :UITextField!
    
    var loginButton:UIButton!
    
    var register : UIButton!
    
    
    
    override init(frame : CGRect)
        
    {
        
        super.init(frame: frame)
        
        
        
        self.backgroundColor = UIColor .red
        
        creatNameTextfiled()
        
        creatPassworkTextfiled()
        
        creatLoginBtn()
        
        creatRegisterBtn()
        
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func creatNameTextfiled()  {
        
        
        
        nameTextfiled = UITextField()
        
        nameTextfiled.placeholder = "输入用户名"
        
        nameTextfiled.frame = CGRect(x: 20, y: 200, width: 335, height: 40)
        
        nameTextfiled.backgroundColor = UIColor.gray
        
        self.addSubview(nameTextfiled)
        
    }
    
    func creatPassworkTextfiled()  {
        
        
        
        passworkTextfiled = UITextField()
        
        passworkTextfiled.placeholder = "输入密码"
        
        passworkTextfiled.frame = CGRect(x: 20, y: 260, width: 335, height: 40)
        
        passworkTextfiled.backgroundColor = UIColor.gray
        
        self.addSubview(passworkTextfiled)
        
    }
    
    func creatLoginBtn() {
        
        
        
        loginButton = UIButton()
        
        loginButton.frame = CGRect(x: 20, y: 320, width: 100, height: 30)
        
        loginButton.setTitle("登录", for: .normal)
        
        loginButton.backgroundColor = UIColor.gray
        
        self.addSubview(loginButton)
        
    }
    
    func creatRegisterBtn() {
        register = UIButton()
        
        register.frame = CGRect(x: 255, y: 320, width: 100, height: 30)
        
        register.setTitle("注册", for: .normal)
        
        register.backgroundColor = UIColor.gray
        
        self.addSubview(register)
        
    }
    
}
