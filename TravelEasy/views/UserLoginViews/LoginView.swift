//
//  LoginView.swift
//  TravelEasy
//
//  Created by Fang Zhang on 2017/12/31.
//  Copyright © 2017年 Fang Zhang. All rights reserved.
//

import UIKit
import SnapKit
import TextFieldEffects

class LoginView: UIView {
    
    var nameTextField :UITextField!
    var passwordTextField :UITextField!
    var loginButton:UIButton!
    var register : UIButton!
    
    var rememberSwitch : UISwitch!
    
    var remeberLabel : UILabel!
    
    var forgetUserLabel : UILabel!
    
    override init(frame : CGRect)
        
    {
        super.init(frame: frame)
        createNameTextField()
        createPasswordTextField()
        creatLoginBtn()
        creatRegisterBtn()
        
        createRememberSwitch()
        
        createRememberLabel()
        
        createForgetUserLabel()

    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func createNameTextField() {
        nameTextField = UITextField()
        self.addSubview(nameTextField)
        nameTextField.placeholder = "输入用户名"
        nameTextField.snp.makeConstraints{ (make) -> Void in
            //make.leadingMargin
            make.size.equalTo(CGSize(width:380,height:40))
            make.centerX.equalTo(self)
            make.centerY.equalTo(200)
        }
        nameTextField.setBottomBorder()
    }
    
    func createPasswordTextField() {
        passwordTextField = UITextField()
        self.addSubview(passwordTextField)
        passwordTextField.placeholder = "输入密码"
        passwordTextField.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:380,height:40))
            make.centerX.equalTo(self)
            make.centerY.equalTo(nameTextField).offset(60)
        }
        passwordTextField.setBottomBorder()
    }
    
    func creatLoginBtn() {
        loginButton = UIButton()
        self.addSubview(loginButton)
        loginButton.setTitle("登录", for: .normal)
        loginButton.backgroundColor = UIColor.gray
        loginButton.layer.cornerRadius=5
        loginButton.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:100,height:30))
            make.left.equalTo(passwordTextField)
            make.centerY.equalTo(passwordTextField).offset(60)
        }
    }
    
    func creatRegisterBtn() {
        register = UIButton()
        self.addSubview(register)
        register.setTitle("注册", for: .normal)
        register.backgroundColor = UIColor.gray
        register.layer.cornerRadius=5
        register.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:100,height:30))
            make.right.equalTo(passwordTextField)
            make.centerY.equalTo(loginButton)
        }
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

