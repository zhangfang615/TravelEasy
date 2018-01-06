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
        self.backgroundColor = UIColor.yellow
        
        createHasAccountLabel()
        
        createUseEmailLabel()
        
//        createCountryTextField()
        
        createPhoneNumberTextField()
        
        createPwdRegisterTextField()
        
        createVerifyPwdRegisterTextField()
        
        createVerificationTextField()
        
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
    
    func createUseEmailLabel() {
        useEmailLabel = UILabel()
        
        useEmailLabel.text = "邮箱注册"
        
        useEmailLabel.frame = CGRect(x: 20, y: 450, width : 80, height: 40)
        
        useEmailLabel.textColor = UIColor.blue
        
        useEmailLabel.isUserInteractionEnabled = true
        
        self.addSubview(useEmailLabel)
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
        phoneNumberTextField.placeholder = "电话号码"
        phoneNumberTextField.keyboardType = UIKeyboardType.numberPad
        phoneNumberTextField.borderStyle = UITextBorderStyle.roundedRect
        phoneNumberTextField.frame = CGRect(x: 20, y: 200, width: 335, height: 40)
        phoneNumberTextField.backgroundColor = UIColor.white
        phoneNumberTextField.tag = 0
        phoneNumberTextField.showDoneButtonOnKeyboard()
        self.addSubview(phoneNumberTextField)
    }
    
    func createVerificationTextField() {
        verificationTextField = UITextField()
        verificationTextField.placeholder = "手机验证码"
        
        verificationTextField.keyboardType = UIKeyboardType.numberPad
        verificationTextField.borderStyle = UITextBorderStyle.roundedRect
        verificationTextField.frame = CGRect(x: 20, y: 260, width: 335, height: 40)
        verificationTextField.backgroundColor = UIColor.white
        verificationTextField.tag = 3
        verificationTextField.isUserInteractionEnabled = false
        verififyPwdRegisterTextField.showDoneButtonOnKeyboard()
        self.addSubview(verificationTextField)
    }
    func createPwdRegisterTextField() {
        pwdRegisterTextField = UITextField()
        pwdRegisterTextField.borderStyle = UITextBorderStyle.roundedRect
        pwdRegisterTextField.placeholder = "输入密码"
        
        pwdRegisterTextField.frame = CGRect(x: 20, y: 320, width: 335, height: 40)
        
        pwdRegisterTextField.backgroundColor  = UIColor.white
        pwdRegisterTextField.tag = 1
        pwdRegisterTextField.isSecureTextEntry = true
        self.addSubview(pwdRegisterTextField)
    }
    
    func createVerifyPwdRegisterTextField() {
        verififyPwdRegisterTextField = UITextField()
        
        verififyPwdRegisterTextField.placeholder = "再次输入密码"
        
        verififyPwdRegisterTextField.frame = CGRect(x: 20, y: 380, width: 335, height: 40)
        verififyPwdRegisterTextField.borderStyle = UITextBorderStyle.roundedRect
        verififyPwdRegisterTextField.backgroundColor = UIColor.white
        verififyPwdRegisterTextField.tag = 2
        verififyPwdRegisterTextField.isSecureTextEntry = true
        self.addSubview(verififyPwdRegisterTextField)
    }
    
    func createRegisterButton() {
        registerButton = UIButton()
        
        registerButton.setTitle("注册", for:.normal)
        
        registerButton.frame = CGRect(x: 20, y: 540, width: 335, height: 40)
        
        registerButton.backgroundColor = UIColor.gray
        
        self.addSubview(registerButton)
    }
    
    func createGetVerificationCodeLabel() {
        getVerificationCodeLabel = UILabel()
        
        getVerificationCodeLabel.text = "获取验证码"
        
        getVerificationCodeLabel.frame = CGRect(x: 264, y: 261, width: 90, height: 38)
        
        getVerificationCodeLabel.textColor = UIColor.blue
        getVerificationCodeLabel.isUserInteractionEnabled = true
        self.addSubview(getVerificationCodeLabel)
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

extension UITextField {
    func showDoneButtonOnKeyboard() {
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(resignFirstResponder))
        
        var toolBarItems = [UIBarButtonItem]()
        toolBarItems.append(flexSpace)
        toolBarItems.append(doneButton)
        
        let doneToolbar = UIToolbar()
        doneToolbar.items = toolBarItems
        doneToolbar.sizeToFit()
        
        inputAccessoryView = doneToolbar
    }
}
