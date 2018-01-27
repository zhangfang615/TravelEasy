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
    
    var rememberSwitch : UISwitch!
    
    var remeberLabel : UILabel!
    
    var forgetUserLabel : UILabel!
    
    override init(frame : CGRect)
        
    {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor .red
        
        creatNameTextfiled()
        
        creatPassworkTextfiled()
        
        creatLoginBtn()
        
        creatRegisterBtn()
        
        createRememberSwitch()
        
        createRememberLabel()
        
        createForgetUserLabel()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func creatNameTextfiled()  {
        
        nameTextfiled = UITextField()
        
        if travelEasyUser.getLoginName() == nil {
            nameTextfiled.placeholder = "输入邮箱， 电话或者用户名"
        }else {
            nameTextfiled.text = travelEasyUser.getLoginName()
        }
        
        nameTextfiled.frame = CGRect(x: 20, y: 200, width: 335, height: 40)
        
        nameTextfiled.backgroundColor = UIColor.gray
        
        nameTextfiled.tag = 0
        
        self.addSubview(nameTextfiled)
        
    }
    
    func creatPassworkTextfiled()  {
        
        
        
        passworkTextfiled = UITextField()
        
        passworkTextfiled.placeholder = "输入密码"
        
        passworkTextfiled.frame = CGRect(x: 20, y: 260, width: 335, height: 40)
        
        passworkTextfiled.backgroundColor = UIColor.gray
        
        passworkTextfiled.isSecureTextEntry = true
        
        passworkTextfiled.tag = 1
        
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
    
    func createRememberSwitch() {
        rememberSwitch = UISwitch()
        
        rememberSwitch.setOn(false, animated: false)
        
        rememberSwitch.frame = CGRect(x: 255, y: 350, width: 40, height: 20)
        
        rememberSwitch.tintColor = UIColor.blue
        rememberSwitch.onTintColor = UIColor.cyan
        rememberSwitch.thumbTintColor = UIColor.red
        rememberSwitch.backgroundColor = UIColor.yellow
        self.addSubview(rememberSwitch)
    }
    
    func createRememberLabel() {
        remeberLabel = UILabel()
        
        remeberLabel.text = "保持登录"
        
        remeberLabel.frame = CGRect(x: 150, y: 350, width : 80, height: 50)
        
        remeberLabel.textColor = UIColor.blue
        
        remeberLabel.isUserInteractionEnabled = false
        
        self.addSubview(remeberLabel)
    }
    
    func createForgetUserLabel() {
        forgetUserLabel = UILabel()
        
        forgetUserLabel.text = "忘记密码"
        
        forgetUserLabel.frame = CGRect(x: 150, y: 400, width : 80, height: 50)
        
        forgetUserLabel.textColor = UIColor.blue
        
        forgetUserLabel.isUserInteractionEnabled = true
        
        self.addSubview(forgetUserLabel)
    }
}
