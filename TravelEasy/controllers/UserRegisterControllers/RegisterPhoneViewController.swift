//
//  RegisterPhoneViewController.swift
//  TravelEasy
//
//  Created by Fang Zhang on 2018/1/1.
//  Copyright © 2018年 Fang Zhang. All rights reserved.
//

import UIKit
import Toast_Swift
import CountryPickerView
import Foundation

class RegisterPhoneViewController: UIViewController {
    
    var registerPhoneV = RegisterPhoneView()
    var currentTextField : Int? = Optional.none
    var registerPhoneNumber : String? = Optional.none
    var registerEmail : String? = Optional.none
    var registerPWD : String? = Optional.none
    var verifyPWD : String? = Optional.none
    var isEligiblePWD: Bool = false
    var usePhoneNumber : Bool = true
    var verificationNumber : String? = Optional.none
    var verificationCode : String? = Optional.none
    let verificationCodeLength = 6
    var countdownTimer: Timer?
    var toastStyle = ToastStyle()
    let cp = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
    
    func creatToastStyle(){
        toastStyle.messageColor  = UIColor.black.withAlphaComponent(0.8)
    }
    var remainingSeconds: Int = 0 {
        willSet {
            self.registerPhoneV.verificationTextField.placeholder = "\(newValue)秒后可重新获取"
            
            if newValue <= 0 {
                self.registerPhoneV.getVerificationCodeLabel.isUserInteractionEnabled = true
                if (usePhoneNumber) {
                    self.registerPhoneV.verificationTextField.placeholder = "手机验证码"
                }else {
                    self.registerPhoneV.verificationTextField.placeholder = "邮箱验证码"
                }
                isCounting = false
            }
        }
    }
    
    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime(timer :)), userInfo: nil, repeats: true)
                
                remainingSeconds = 10
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
            }
            
            self.registerPhoneV.getVerificationCodeLabel.isUserInteractionEnabled = !newValue
        }
    }
    @objc func updateTime(timer: Timer) {
        remainingSeconds -= 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "注册"
        self.view.backgroundColor = UIColor.white
        
        registerPhoneV = RegisterPhoneView(frame: CGRect( x:0,y:0,width:375,height:667))
        registerPhoneV.phoneNumberTextField.delegate = self as? UITextFieldDelegate
        registerPhoneV.pwdRegisterTextField.delegate = self as? UITextFieldDelegate
        registerPhoneV.verififyPwdRegisterTextField.delegate = self as? UITextFieldDelegate
        registerPhoneV.phoneNumberTextField.leftViewMode = .always
        registerPhoneV.phoneNumberTextField.leftView = cp
        // Do any additional setup after loading the view.
        
        registerPhoneV.phoneNumberTextField.addTarget(self, action: #selector(touchTextField(textField:)), for: .touchDown)
        registerPhoneV.phoneNumberTextField.addTarget(self, action: #selector(textFieldEditingDidEndOnExit(textField:)), for: .editingDidEndOnExit)
        registerPhoneV.pwdRegisterTextField.addTarget(self, action: #selector(touchTextField(textField:)), for: .touchDown)
        registerPhoneV.pwdRegisterTextField.addTarget(self, action: #selector(textFieldEditingDidEndOnExit(textField:)), for: .editingDidEndOnExit)
        registerPhoneV.pwdRegisterTextField.addTarget(self, action: #selector(pwdRegisterTextFieldDidChange(textField :)), for: .editingChanged)
        
        registerPhoneV.verififyPwdRegisterTextField.addTarget(self, action: #selector(touchTextField(textField:)), for: .touchDown)
        registerPhoneV.verififyPwdRegisterTextField.addTarget(self, action: #selector(textFieldEditingDidEndOnExit(textField:)), for: .editingDidEndOnExit)
//        registerPhoneV.verififyPwdRegisterTextField.addTarget(slef, action: #selector(verififyPwdRegisterTextFieldDidChange(textFiedl :)), for: .editingChanged)
        
        registerPhoneV.verificationTextField.addTarget(self, action: #selector(touchTextField(textField:)), for: .touchDown)
        registerPhoneV.verificationTextField.addTarget(self, action: #selector(textFieldEditingDidEndOnExit(textField:)), for: .editingDidEndOnExit)
        registerPhoneV.verificationTextField.addTarget(self, action: #selector(verificationTextFieldDidChange(textField:)), for: .editingChanged)
        
        registerPhoneV.registerButton.addTarget(self, action: #selector(register(button:)), for: .touchDown)
        
        self.registerPhoneV.hasAccountLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hasAccountLabelTap(sender:))))
        self.registerPhoneV.useEmailLabel.addGestureRecognizer(UITapGestureRecognizer(target : self, action : #selector(useEmailLabelTap(sender :))))
        self.registerPhoneV.getVerificationCodeLabel.addGestureRecognizer(UITapGestureRecognizer(target : self, action : #selector(getVerificationCodeLabelTap(sender :))))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:))))
        
        self.view.addSubview(registerPhoneV)
    }
    
    @objc func verificationTextFieldDidChange(textField: UITextField) {
        if((self.registerPhoneV.verificationTextField.text?.count)! > verificationCodeLength){
            let index = self.registerPhoneV.verificationTextField.text?.index((self.registerPhoneV.verificationTextField.text?.startIndex)!, offsetBy:6)
            self.registerPhoneV.verificationTextField.text = self.registerPhoneV.verificationTextField.text?.substring(to: index!)
            self.view.makeToast("验证码为6位数字", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
        }
    }
    
    @objc func pwdRegisterTextFieldDidChange(textField : UITextField){
        if((self.registerPhoneV.pwdRegisterTextField.text?.count)! < 8 || (self.registerPhoneV.pwdRegisterTextField.text?.count)! > 12){
            self.view.makeToast("密码长度为8-16位", duration: 1.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
        }
    }
//
//    @objc func verififyPwdRegisterTextFieldDidChange(textFiedl : UITextField){
//        let PWD : String = self.registerPhoneV.pwdRegisterTextField.text?
//        let verifyPWD : String = self.registerPhoneV.verififyPwdRegisterTextField.text?
//        if ( PWD == nil){
//            self.view.makeToast("密码不能为空", duration: 1.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
//                if didTap {
//                    print("completion from tap")
//                } else {
//                    print("completion without tap")
//                }
//            }
//        }else if(PWD.count < verifyPWD.count){
//            self.view.makeToast("", duration: 1.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
//                if didTap {
//                    print("completion from tap")
//                } else {
//                    print("completion without tap")
//                }
//            }
//        }
//    }
    
    @objc func touchTextField(textField: UITextField) {
//        textField.becomeFirstResponder()
        
        if(currentTextField == nil) {
        currentTextField = textField.tag
        } else if (currentTextField != textField.tag){
        if (currentTextField! == 0){
            print("输入结束 收回键盘0")
            self.registerPhoneV.phoneNumberTextField.resignFirstResponder()
            if (usePhoneNumber == true){
                registerPhoneNumber = self.registerPhoneV.phoneNumberTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.phoneNumberTextField.text
            }else {
                registerEmail = self.registerPhoneV.phoneNumberTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.phoneNumberTextField.text
            }
            currentTextField = textField.tag
        }
        else if (currentTextField! == 1){
            self.registerPhoneV.pwdRegisterTextField.resignFirstResponder()
            print("输入结束 收回键盘1")
            registerPWD = self.registerPhoneV.pwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.pwdRegisterTextField.text
            currentTextField = textField.tag
        }
        else if (currentTextField! == 2){
            self.registerPhoneV.verififyPwdRegisterTextField.resignFirstResponder()
            print("输入结束 收回键盘2")
            verifyPWD = self.registerPhoneV.verififyPwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.verififyPwdRegisterTextField.text
            currentTextField = textField.tag
        }else if (currentTextField! == 3) {
            self.registerPhoneV.verificationTextField.resignFirstResponder()
            print("输入结束 收回键盘3")
            verificationNumber =  self.registerPhoneV.verificationTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.verificationTextField.text
            currentTextField = textField.tag
            }
        }
    }
    
    @objc func textFieldEditingDidEndOnExit(textField: UITextField) {
        if (currentTextField! == 0){
            print("return 收回键盘0")
            self.registerPhoneV.phoneNumberTextField.resignFirstResponder()
            if (usePhoneNumber == true){
                registerPhoneNumber = self.registerPhoneV.phoneNumberTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.phoneNumberTextField.text
            }else {
                registerEmail = self.registerPhoneV.phoneNumberTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.phoneNumberTextField.text
            }
        }
        else if (currentTextField! == 1){
            self.registerPhoneV.pwdRegisterTextField.resignFirstResponder()
            print("return 收回键盘1")
            registerPWD = self.registerPhoneV.pwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.pwdRegisterTextField.text
        }
        else if (currentTextField! == 2){
            self.registerPhoneV.verififyPwdRegisterTextField.resignFirstResponder()
            print("return 收回键盘2")
            verifyPWD = self.registerPhoneV.verififyPwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.verififyPwdRegisterTextField.text
        }
        else if (currentTextField! == 3) {
            self.registerPhoneV.verificationTextField.resignFirstResponder()
            print("return 收回键盘3")
            verificationNumber = self.registerPhoneV.verificationTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.verificationTextField.text
        }
        
        currentTextField = Optional.none
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if (currentTextField != nil) {
            if (currentTextField! == 0){
                self.registerPhoneV.phoneNumberTextField.resignFirstResponder()
                if (usePhoneNumber == true){
                    registerPhoneNumber = self.registerPhoneV.phoneNumberTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.phoneNumberTextField.text
                }else {
                    registerEmail = self.registerPhoneV.phoneNumberTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.phoneNumberTextField.text
                }
            }
            else if (currentTextField! == 1){
                self.registerPhoneV.pwdRegisterTextField.resignFirstResponder()
                print("收回键盘1")
                registerPWD = self.registerPhoneV.pwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.pwdRegisterTextField.text
            }
            else if (currentTextField! == 2){
                self.registerPhoneV.verififyPwdRegisterTextField.resignFirstResponder()
                print("收回键盘2")
                verifyPWD = self.registerPhoneV.verififyPwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.verififyPwdRegisterTextField.text
            }
            else if (currentTextField! == 3) {
                self.registerPhoneV.verificationTextField.resignFirstResponder()
                print("return 收回键盘3")
                verificationNumber = self.registerPhoneV.verificationTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.verificationTextField.text
                }
        }
       
        sender.cancelsTouchesInView = false
        currentTextField = Optional.none
        }
    }
    
    @objc func hasAccountLabelTap(sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func useEmailLabelTap(sender: UITapGestureRecognizer) {
        self.registerPhoneV.phoneNumberTextField.text = Optional.none
        isCounting = false
        if (usePhoneNumber == true) {
            self.registerPhoneV.useEmailLabel.text = "手机注册"
            self.registerPhoneV.phoneNumberTextField.placeholder = "邮箱地址"
            self.registerPhoneV.verificationTextField.placeholder = "邮箱验证码"
            self.registerPhoneV.phoneNumberTextField.text = Optional.none
            self.registerPhoneV.phoneNumberTextField.keyboardType = .emailAddress
            self.registerPhoneV.phoneNumberTextField.leftView = nil
            usePhoneNumber = false
        }else {
            self.registerPhoneV.useEmailLabel.text = "邮箱注册"
            self.registerPhoneV.phoneNumberTextField.placeholder = "手机号码"
            self.registerPhoneV.verificationTextField.placeholder = "手机验证码"
            self.registerPhoneV.phoneNumberTextField.text = Optional.none
            self.registerPhoneV.phoneNumberTextField.keyboardType = .numberPad
            self.registerPhoneV.phoneNumberTextField.leftView = cp
            usePhoneNumber = true
        }
        currentTextField = Optional.none
        self.registerPhoneV.verificationTextField.isUserInteractionEnabled = false
        self.registerPhoneV.verificationTextField.text = Optional.none
        registerPWD = self.registerPhoneV.pwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.pwdRegisterTextField.text
        verifyPWD = self.registerPhoneV.verififyPwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.verififyPwdRegisterTextField.text
    }
    
    @objc func getVerificationCodeLabelTap(sender: UITapGestureRecognizer){
        //Todo: phonenumber of email is eligible?
        //Todo: Generate verification number
        //Todo: send verification code
        verificationCode = Optional.none
        if(currentTextField != nil){
        if (currentTextField! == 0){
                self.registerPhoneV.phoneNumberTextField.resignFirstResponder()
                if (usePhoneNumber == true){
                    registerPhoneNumber = self.registerPhoneV.phoneNumberTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.phoneNumberTextField.text
                }else {
                    registerEmail = self.registerPhoneV.phoneNumberTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.phoneNumberTextField.text
                }
            }
            else if (currentTextField! == 1){
                self.registerPhoneV.pwdRegisterTextField.resignFirstResponder()
                print("收回键盘1")
                registerPWD = self.registerPhoneV.pwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.pwdRegisterTextField.text
            }
            else if (currentTextField! == 2){
                self.registerPhoneV.verififyPwdRegisterTextField.resignFirstResponder()
                print("收回键盘2")
                verifyPWD = self.registerPhoneV.verififyPwdRegisterTextField.text?.count == 0 ? Optional.none : self.registerPhoneV.verififyPwdRegisterTextField.text
            }
            else if (currentTextField! == 3) {
                self.registerPhoneV.verificationTextField.resignFirstResponder()
                print("return 收回键盘3")
                self.registerPhoneV.verificationTextField.text = Optional.none
            verificationNumber = Optional.none
            }
        }
        currentTextField = Optional.none
        if (usePhoneNumber == true){
            if (self.registerPhoneV.phoneNumberTextField.text?.count == 0 || isValidPhoneNumber(phoneNumberStr: self.cp.selectedCountry.phoneCode + self.registerPhoneV.phoneNumberTextField.text!)  == false) {
                print("\(self.cp.selectedCountry.phoneCode)")
            self.view.makeToast("请输入有效电话号码", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
            }
            else {
                self.registerPhoneV.verificationTextField.isUserInteractionEnabled = true
                self.registerPhoneV.verificationTextField.text = Optional.none
                isCounting = true
            }
        }else {
            if (self.registerPhoneV.phoneNumberTextField.text?.count == 0 || isValidEmail(emailStr : self.registerPhoneV.phoneNumberTextField.text!)  == false){
                self.view.makeToast("请输入有效邮箱", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                    if didTap {
                        print("completion from tap")
                    } else {
                        print("completion without tap")
                    }
                }
            }
            else {
                self.registerPhoneV.verificationTextField.isUserInteractionEnabled = true
                self.registerPhoneV.verificationTextField.text = Optional.none
                isCounting = true
                let emailVerifyUrl = urlString!.appendingPathComponent(urlEmailVerification).appendingPathComponent(registerEmail!)
                let request = URLRequest(url: emailVerifyUrl as URL)
                do {
                    // Perform the request
                    var response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
                    do {
                        let data = try NSURLConnection.sendSynchronousRequest(request, returning: response)
                        let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                        verificationCode = jsonSerialized!["verificationCode"]! as! String
                        print(verificationCode)
                    }
                    catch{
                        print("wrong")
                    }
                }
                
            }
            }
    }
    
    

    
    @objc func register(button : UIButton){
        let phoneNumber = self.registerPhoneV.phoneNumberTextField.text
        let verificationStr = self.registerPhoneV.verificationTextField.text
        let passwordStr = self.registerPhoneV.pwdRegisterTextField.text
        let verifyPWD = self.registerPhoneV.verififyPwdRegisterTextField.text
        print("\(self.cp.selectedCountry.name)")
        print("\(self.cp.selectedCountry.phoneCode)")
        

        if (usePhoneNumber == true && (phoneNumber?.count == 0 || !isValidPhoneNumber(phoneNumberStr: phoneNumber!))){
                self.view.makeToast("请输入有效电话号码", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                    if didTap {
                        print("completion from tap")
                    } else {
                        print("completion without tap")
                    }
                }
        }
        else if (usePhoneNumber == false && (phoneNumber?.count == 0 || !isValidEmail(emailStr: phoneNumber!))){
            self.view.makeToast("请输入有效邮箱", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
        }
        else if (verificationStr?.count != 6){
            self.view.makeToast("请输入有效验证码", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
        }
        else if( (passwordStr?.count)! < 8 || (passwordStr?.count)! > 16){
            self.view.makeToast("请输入有效密码", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
        }else if (passwordStr != verifyPWD){
            self.view.makeToast("密码输入不一致", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
        }else if (verificationNumber! != verificationCode!){
            self.view.makeToast("验证码不正确，请重新输入", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                if didTap {
                    print("completion from tap")
                } else {
                    print("completion without tap")
                }
            }
        }
        else{
            var isRegistered : String
            if(usePhoneNumber == true){
                isRegistered = phoneRegister(userPhone: phoneNumber!, registerPassword: passwordStr!)
            } else{
                isRegistered = emailRegister(userEmail: phoneNumber!, registerPassword: passwordStr!)
            }
            if (isRegistered == "registered") {
                self.view.makeToast("成功注册， 返回登录页面", duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                    if didTap {
                        print("completion from tap")
                    } else {
                        print("completion without tap")
                    }
                }
                self.navigationController?.popViewController(animated: true)
            }else {
                self.view.makeToast(isRegistered, duration: 2.0, point: CGPoint(x: 200.0, y: 200.0), title: "提示", image: UIImage(named: "toast.png"), style: toastStyle){ didTap in
                    if didTap {
                        print("completion from tap")
                    } else {
                        print("completion without tap")
                    }
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: emailStr)
        return result
    }
    
    func isValidPhoneNumber(phoneNumberStr: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: phoneNumberStr)
        if result == true {
            return true
        }else {
            return false
        }
    }
    
    func phoneRegister(userPhone:String, registerPassword:String) -> String
    {

        let request = NSMutableURLRequest(url:urlString!.appendingPathComponent("phoneRegister"))
        let body = "user_name=\(userPhone)&user_password=\(registerPassword)"
        //编码POST数据
        let postData = body.data(using: String.Encoding.utf8)
        //保用 POST 提交
        request.httpMethod = "POST"
        request.httpBody = postData
        
        //响应对象
//        var response:URLResponse?
        var response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
        do{
            //发出请求
            let data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: response)
            let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            return "registered"
//            verificationCode = jsonSerialized!["user_name"]! as! String
//            print(verificationCode)
        }catch let error as NSError{
//            //打印错误消息
//            print(error.code)
            return error.description
        }
    }
    
    func emailRegister(userEmail:String, registerPassword:String) -> String
    {
        
        let request = NSMutableURLRequest(url:urlString!.appendingPathComponent("emailRegister"))
        let body = "user_name=\(userEmail)&user_password=\(registerPassword)"
        //编码POST数据
        let postData = body.data(using: String.Encoding.utf8)
        //保用 POST 提交
        request.httpMethod = "POST"
        request.httpBody = postData
        
        //响应对象
        //        var response:URLResponse?
        var response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
        do{
            //发出请求
            let data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: response)
            let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
//            verificationCode = jsonSerialized!["user_name"]! as! String
            return "registered"
        }catch let error as NSError{
//            //打印错误消息
//            print(error.code)
            return error.description
        }
    }
}


