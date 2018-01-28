//
//  TravelEasyUser.swift
//  TravelEasy
//
//  Created by zhuminxin on 2018/1/27.
//  Copyright © 2018年 Fang Zhang. All rights reserved.
//

import Foundation

class TravelEasyUser {
    private var userId : Int?
    private var userName : String?
    private var loginName: String?
    //    private var userPassword : String?
    //    private var userEmail : String?
    //    private var userPhone : String?
    private var token: String?
    var isLogin : Bool = false;
    
    init(){
        
    }
    
    init(userId: Int?, userName: String?, loginName:String?,token: String?){
        if userId == nil {
            self.userId = nil
        }else {
            self.userId = userId!
        }
        if userName == nil {
            self.userName = nil
        }else {
            self.userName = userName!
        }
        if loginName == nil {
            self.loginName = nil
        }else {
            self.loginName = loginName!
        }
        if token == nil{
            self.token = nil
        }else {
            self.token = token!
        }
    }
    func getUserId() -> Int? {
        return userId
    }
    
    func setUserId(newUserId : Int?){
        if newUserId != nil {
            userId = newUserId
        }else {
            userId = nil
        }
    }
    
    func getUserName() -> String? {
        return userName
    }
    
    func setUserName(newUserName : String?){
        if newUserName != nil{
            userName = newUserName
        }else {
            userName = nil
        }
    }
    
    func getLoginName() -> String? {
        return loginName
    }
    
    func setLoginName(newLoginName : String?){
        if newLoginName != nil {
            loginName = newLoginName
        }else {
            loginName = nil
        }
    }
    
    func getToken() -> String? {
        return token
    }
    
    func setToken(userToken : String?){
        if userToken != nil {
            token = userToken!
        }else {
            token = nil
        }
    }
    
    func setAll(userId : Int, userName: String, loginName: String, token: String){
        self.userId = userId
        self.userName = userName
        self.loginName = loginName
        self.token = token
    }
}
