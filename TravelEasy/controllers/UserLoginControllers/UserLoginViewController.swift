//
//  UserLoginViewController.swift
//  TravelEasy
//
//  Created by Fang Zhang on 2017/12/30.
//  Copyright © 2017年 Fang Zhang. All rights reserved.
//

import UIKit
import Toast_Swift
import SwiftyJSON
import Alamofire

<<<<<<< HEAD

class UserLoginViewController: UIViewController {
=======
class UserLoginViewController: UIViewController, ParamsProtocol {
>>>>>>> 90388326109ef80605a6a6a9778cd12d1279dbb0
    
    var currentTextField : Int? = Optional.none
    var userName : String? = Optional.none
    var userPassword : String? = Optional.none
    var toastStyle = ToastStyle()
    var codeV = LoginView()
    var rememberMe = false;
    func returnParams(loginNameStr: String, loginPasswordStr: String) {
        self.codeV.nameTextfiled.text = loginNameStr
        self.codeV.passworkTextfiled.text = loginPasswordStr
    }
    
    func creatToastStyle(){
        toastStyle.messageColor  = UIColor.black.withAlphaComponent(0.8)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        self.view.backgroundColor = UIColor.white
<<<<<<< HEAD
        codeV = LoginView(frame: CGRect( x:0,y:0,width:self.view.frame.width,height:self.view.frame.height))
        codeV.nameTextField.delegate = self as? UITextFieldDelegate
        codeV.passwordTextField.delegate = self as? UITextFieldDelegate
        codeV.loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        codeV.register.addTarget(self, action: #selector(registerEvent(textFd:)), for: .touchUpInside)
=======
        codeV = LoginView(frame: CGRect( x:0,y:0,width:375,height:667))
        codeV.nameTextfiled.delegate = self as? UITextFieldDelegate
        codeV.passworkTextfiled.delegate = self as? UITextFieldDelegate
        rememberMe = codeV.rememberSwitch.isOn
        codeV.loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        codeV.register.addTarget(self, action: #selector(registerEvent(textFd:)), for: .touchUpInside)
        codeV.nameTextfiled.addTarget(self, action: #selector(touchTextField(textField:)), for: .touchDown)
        codeV.nameTextfiled.addTarget(self, action: #selector(textFieldEditingDidEndOnExit(textField:)), for: .editingDidEndOnExit)
        codeV.passworkTextfiled.addTarget(self, action: #selector(touchTextField(textField:)), for: .touchDown)
        codeV.passworkTextfiled.addTarget(self, action: #selector(textFieldEditingDidEndOnExit(textField:)), for: .editingDidEndOnExit)
        codeV.rememberSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: UIControlEvents.valueChanged)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:))))

>>>>>>> 90388326109ef80605a6a6a9778cd12d1279dbb0
        self.view.addSubview(codeV)
        // Do any additional setup after loading the view.
        /*codeV.translatesAutoresizingMaskIntoConstraints = false
        codeV.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        codeV.leadingAnchor.constraint(equalTo:self.view.leadingAnchor).isActive = true
        codeV.trailingAnchor.constraint(equalTo:self.view.trailingAnchor).isActive = true*/
 
 }
    
    @objc func loginEvent () {
        userName = self.codeV.nameTextfiled.text
        userPassword = self.codeV.passworkTextfiled.text
        if(userName?.count == 0){
            makeToast(view: self.view, message : "请输入有效邮箱或者电话号码", duration : 2.0, point : CGPoint(x: 200.0, y: 200.0), title : "提示", image : UIImage(named: "toast.png"), style : toastStyle)
        }else if (userPassword?.count == 0){
            makeToast(view: self.view, message : "请输入有效密码", duration : 2.0, point : CGPoint(x: 200.0, y: 200.0), title : "提示", image : UIImage(named: "toast.png"), style : toastStyle)
        }else{
            let apiURL = urlString!.appendingPathComponent("userLogin")
            let param: Dictionary = ["user_name":userName!,"user_password":userPassword!] as [String : Any]
            postAPI(param : param, apiURL:  apiURL) {
                JSONResponse, error in
                if error == nil {
                    let isLogged = JSONResponse!["isLogged"].string!
                    if isLogged == "true" {
                        if self.rememberMe == true {
                            self.storeUserDefaults(loginName: self.userName!, userPasword: self.userPassword!, loginResult: JSONResponse!)
                        }
                        self.storeTravelEasyUser(loginName: self.userName!, loginResult : JSONResponse!)
                        travelEasyUser.isLogin = true
                        makeToast(view: self.view, message : "登录成功", duration : 2.0, point : CGPoint(x: 200.0, y: 200.0), title : "提示", image : UIImage(named: "toast.png"), style : self.toastStyle)
                        self.navigationController?.popViewController(animated: true)
                    }
                    else {
                        makeToast(view: self.view, message : "登录不成功", duration : 2.0, point : CGPoint(x: 200.0, y: 200.0), title : "提示", image : UIImage(named: "toast.png"), style : self.toastStyle)
                    }
                }else {
                    makeToast(view: self.view, message : (error?.localizedDescription)!, duration : 2.0, point : CGPoint(x: 200.0, y: 200.0), title : "提示", image : UIImage(named: "toast.png"), style : self.toastStyle)
                }
            }
        }
    }
    
    @objc func registerEvent(textFd :UITextField )   {
        let registerVC = RegisterPhoneViewController()
        registerVC.paramsProtocolDelegate = self
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
<<<<<<< HEAD
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
=======
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if (currentTextField != nil) {
                if (currentTextField! == 0){
                    self.codeV.nameTextfiled.resignFirstResponder()
                    userName = self.codeV.nameTextfiled.text?.count == 0 ? Optional.none : self.codeV.nameTextfiled.text
                }
                else if (currentTextField! == 1){
                    self.codeV.passworkTextfiled.resignFirstResponder()
                    userPassword = self.codeV.passworkTextfiled.text?.count == 0 ? Optional.none : self.codeV.passworkTextfiled.text
                }
            }
            
            sender.cancelsTouchesInView = false
            currentTextField = Optional.none
        }
    }
    @objc func touchTextField(textField: UITextField) {
        if(currentTextField ==  nil){
            currentTextField = textField.tag
        }else if (currentTextField! != textField.tag){
            if (currentTextField! == 0){
                self.codeV.nameTextfiled.resignFirstResponder()
                userName = self.codeV.nameTextfiled.text?.count == 0 ? Optional.none : self.codeV.nameTextfiled.text
            }else {
                self.codeV.passworkTextfiled.resignFirstResponder()
                userPassword = self.codeV.passworkTextfiled.text?.count == 0 ? Optional.none : self.codeV.passworkTextfiled.text
            }
            currentTextField = textField.tag
        }
    }
    
    @objc func textFieldEditingDidEndOnExit(textField: UITextField){
        if(currentTextField! == 0){
            self.codeV.nameTextfiled.resignFirstResponder()
            userName = self.codeV.nameTextfiled.text?.count == 0 ? Optional.none : self.codeV.nameTextfiled.text
        }else {
            self.codeV.passworkTextfiled.resignFirstResponder()
            userPassword = self.codeV.passworkTextfiled.text?.count == 0 ? Optional.none : self.codeV.passworkTextfiled.text
        }
    }
    
    @objc func switchChanged(sender:UISwitch) {
        rememberMe = sender.isOn 
    }
    
    func storeUserDefaults(loginName : String, userPasword : String, loginResult : JSON){
        let defaults = UserDefaults.standard
        defaults.set(loginResult["userInformation"][0]["user_id"].int!, forKey: "TravelEasyUserId")
        defaults.set(loginName, forKey: "TravelEasyUserLoginName")
        defaults.set(loginResult["userInformation"][0]["user_name"].string!, forKey: "TravelEasyUserName")
        defaults.set(userPasword, forKey: "TravelEasyPassword")
        defaults.set(loginResult["userInformation"][0]["token"].string!, forKey: "TravelEasyToken")
    }
    
    func storeTravelEasyUser(loginName: String, loginResult : JSON) {
        travelEasyUser.setAll(userId: loginResult["userInformation"][0]["user_id"].int!,
                              userName: loginResult["userInformation"][0]["user_name"].string!,
                              loginName: loginName,
                              token: loginResult["userInformation"][0]["token"].string!)
>>>>>>> 90388326109ef80605a6a6a9778cd12d1279dbb0
    }

}


