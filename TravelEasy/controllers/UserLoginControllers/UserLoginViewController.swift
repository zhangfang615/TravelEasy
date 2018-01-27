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
        codeV = LoginView(frame: CGRect( x:0,y:0,width:self.view.frame.width,height:self.view.frame.height))
        codeV.nameTextField.delegate = self as? UITextFieldDelegate
        codeV.passwordTextField.delegate = self as? UITextFieldDelegate
        codeV.loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
        codeV.register.addTarget(self, action: #selector(registerEvent(textFd:)), for: .touchUpInside)
        self.view.addSubview(codeV)
        // Do any additional setup after loading the view.
        /*codeV.translatesAutoresizingMaskIntoConstraints = false
        codeV.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        codeV.leadingAnchor.constraint(equalTo:self.view.leadingAnchor).isActive = true
        codeV.trailingAnchor.constraint(equalTo:self.view.trailingAnchor).isActive = true*/
 
 }
    
    @objc func loginEvent () {
        self.navigationController?.popViewController(animated: true)
        isLogin = true
    }
    
    
    @objc func registerEvent(textFd :UITextField )   {
        let registerVC = RegisterPhoneViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
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


