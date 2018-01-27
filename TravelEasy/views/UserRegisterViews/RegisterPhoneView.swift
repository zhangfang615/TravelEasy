//
//  RegisterPhoneView.swift
//  TravelEasy
//
//  Created by Fang Zhang on 2018/1/1.
//  Copyright © 2018年 Fang Zhang. All rights reserved.
//

import UIKit
import CountryPickerView

class RegisterPhoneView: UIView {
    
    var hasAccountLabel : UILabel!
    var useEmailLabel : UILabel!
//    var countryTextField : UITextField!
    var phoneNumberTextField : UITextField!
    var verificationTextField : UITextField!
    var pwdRegisterTextField : UITextField!
    var verififyPwdRegisterTextField : UITextField!
    var registerButton : UIButton!
    var getVerificationCodeLabel : UILabel!
    
    
    override init(frame : CGRect)
        
    {
        
        super.init(frame: frame)
        
        //createHasAccountLabel()
        
        
        
//        createCountryTextField()
        
        createPhoneNumberTextField()
        createVerificationTextField()
        createPwdRegisterTextField()
        createVerifyPwdRegisterTextField()
        createUseEmailLabel()
        createRegisterButton()
        createGetVerificationCodeLabel()
//        creatAreaDropDownMenuButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func createHasAccountLabel() {
        hasAccountLabel = UILabel()
        
        hasAccountLabel.text = "已有账户"
        
        hasAccountLabel.frame = CGRect(x: 200, y: 50, width : 80, height: 50)
        
        hasAccountLabel.textColor = UIColor.blue
        
        hasAccountLabel.isUserInteractionEnabled = true
        
        self.addSubview(hasAccountLabel)
    }
    

    
//    func createCountryTextField() {
//        countryTextField = UITextField()
//        countryTextField.placeholder = "国家"
//        countryTextField.borderStyle = UITextBorderStyle.roundedRect
//        countryTextField.frame = CGRect(x: 20, y: 140, width: 200, height: 40)
//        countryTextField.tag = 3
//        let salutations = ["", "Mr.", "Ms.", "Mrs."]
//        countryTextField.loadDropdownData(data: salutations)
//        self.addSubview(countryTextField)
//    }
    
    func createPhoneNumberTextField() {
        phoneNumberTextField = UITextField()
        self.addSubview(phoneNumberTextField)
        phoneNumberTextField.placeholder = "电话号码"
        phoneNumberTextField.keyboardType = UIKeyboardType.numberPad
        phoneNumberTextField.tag = 0
        phoneNumberTextField.showDoneButtonOnKeyboard()
        phoneNumberTextField.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:380,height:40))
            make.centerX.equalTo(self)
            make.centerY.equalTo(200)
        }
        phoneNumberTextField.setBottomBorder()
    }
    
    func createVerificationTextField() {
        verificationTextField = UITextField()
        self.addSubview(verificationTextField)
        verificationTextField.placeholder = "手机验证码"
        verificationTextField.keyboardType = UIKeyboardType.numberPad
        verificationTextField.tag = 3
        verificationTextField.isUserInteractionEnabled = false
        verificationTextField.showDoneButtonOnKeyboard()
        verificationTextField.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:380,height:40))
            make.centerX.equalTo(self)
            make.centerY.equalTo(phoneNumberTextField).offset(60)
        }
        verificationTextField.setBottomBorder()
    }
    
    func createPwdRegisterTextField() {
        pwdRegisterTextField = UITextField()
        self.addSubview(pwdRegisterTextField)
        pwdRegisterTextField.placeholder = "输入密码"
        pwdRegisterTextField.tag = 1
        pwdRegisterTextField.isSecureTextEntry = true
        pwdRegisterTextField.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:380,height:40))
            make.centerX.equalTo(self)
            make.centerY.equalTo(verificationTextField).offset(60)
        }
        pwdRegisterTextField.setBottomBorder()
    }
    
    func createVerifyPwdRegisterTextField() {
        verififyPwdRegisterTextField = UITextField()
        self.addSubview(verififyPwdRegisterTextField)
        verififyPwdRegisterTextField.placeholder = "再次输入密码"
        verififyPwdRegisterTextField.tag = 2
        verififyPwdRegisterTextField.isSecureTextEntry = true
        verififyPwdRegisterTextField.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:380,height:40))
            make.centerX.equalTo(self)
            make.centerY.equalTo(pwdRegisterTextField).offset(60)
        }
        verififyPwdRegisterTextField.setBottomBorder()
        
    }
    
    func createUseEmailLabel() {
        useEmailLabel = UILabel()
        self.addSubview(useEmailLabel)
        useEmailLabel.text = "邮箱注册"
        useEmailLabel.textColor = UIColor.blue
        useEmailLabel.isUserInteractionEnabled = true
        useEmailLabel.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:80,height:40))
            make.left.equalTo(verififyPwdRegisterTextField)
            make.centerY.equalTo(verififyPwdRegisterTextField).offset(60)
        }
    }
    
    func createRegisterButton() {
        registerButton = UIButton()
        self.addSubview(registerButton)
        registerButton.setTitle("注册", for:.normal)
        registerButton.backgroundColor = UIColor.gray
        registerButton.layer.cornerRadius = 5
        registerButton.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:380,height:40))
            make.left.equalTo(useEmailLabel)
            make.centerY.equalTo(useEmailLabel).offset(60)
        }
    }
    
    func createGetVerificationCodeLabel() {
        getVerificationCodeLabel = UILabel()
        self.addSubview(getVerificationCodeLabel)
        getVerificationCodeLabel.text = "获取验证码"
        getVerificationCodeLabel.textColor = UIColor.blue
        getVerificationCodeLabel.isUserInteractionEnabled = true
        getVerificationCodeLabel.snp.makeConstraints{ (make) -> Void in
            make.size.equalTo(CGSize(width:90,height:38))
            make.right.equalTo(phoneNumberTextField)
            make.centerY.equalTo(phoneNumberTextField).offset(60)
        }
    }
    
    
//    func creatAreaDropDownMenuButton()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

