//
//  InformationViewController.swift
//  爱游
//
//  Created by Fang Zhang on 2017/12/27.
//  Copyright © 2017年 Fang Zhang. All rights reserved.
//

import UIKit
class InformationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var tableView = UITableView()
    private static let cellIdentifier = "Information"
    var section1 = ["我的钱包","我的行程","发起行程"]
    var section2 = ["好友列表","我的动态","我的心愿", "我的评分/评论"]
    var section3 = ["我的日历","设置","申请成为导游"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        
//        tableView.frame = CGRect(0 , 0, self.view.bounds.width, self.view.bounds.height)//Optiona                                                                        l for table size
        
        self.view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: InformationViewController.cellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch (section){
        case 0:
            return 1
        case 1:
//            tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
            return 3
        case 2:
            return 4
        default:
            return 3
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section != 0) {
            return 10
        }
        else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section != 0) {
        let vw = UIView()
        vw.backgroundColor = UIColor.gray
        
        return vw
        }
        else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorColor = UIColor.gray
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
//        tableView.separatorEffect = 
        let myCell = tableView.dequeueReusableCell(withIdentifier: InformationViewController.cellIdentifier, for: indexPath)
        myCell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        switch (indexPath.section) {
        case 0:
            if (isLogin == true){
                myCell.textLabel?.text = "已登录"
            }else{
                myCell.textLabel?.text = "未登录"
            }
        case 1:
            myCell.textLabel?.text = section1[indexPath.row]
            
        case 2:
            myCell.textLabel?.text = section2[indexPath.row]
        case 3:
            myCell.textLabel?.text = section3[indexPath.row]
        default:
            myCell.textLabel?.text = "NA"
        }
        
//        myCell.layoutMargins = UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
//        myCell.separatorInset = UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
        return myCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch (indexPath.section){
        case 0:
            let destination = OrderViewController()
            destination.view.backgroundColor = UIColor.white
            destination.hidesBottomBarWhenPushed = true
            destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
            navigationController?.pushViewController(destination, animated: true)
        case 1:
            switch (indexPath.row){
            case 0:
                if (isLogin == true){
                let destination = eWalletViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            case 1:
                if (isLogin == true){
                let destination = JourneyViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            default:
                if (isLogin == true){
                let destination = SetJourneyViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            }
        case 2:
            switch (indexPath.row){
            case 0:
                if (isLogin == true){
                let destination = FriendListViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            case 1:
                if (isLogin == true){
                let destination = MyMomentsViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            case 2:
                if (isLogin == true){
                let destination = MyWishViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            default:
                if (isLogin == true){
                let destination = MyCommentsViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            }
        default:
            switch (indexPath.row) {
            case 0:
                if (isLogin == true){
                let destination = MyCalendarViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            case 1:
                if (isLogin == true){
                let destination = SettingsViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            default:
                if (isLogin == true){
                let destination = GuideApplicationViewController()
                destination.hidesBottomBarWhenPushed = true
                destination.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
                navigationController?.pushViewController(destination, animated: true)
                }
                else{
                    let destination = UserLoginViewController()
                    destination.hidesBottomBarWhenPushed = true
                    navigationController?.pushViewController(destination, animated: true)
                }
            }
        }
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
