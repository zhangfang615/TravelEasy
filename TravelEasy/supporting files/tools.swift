//
//  tools.swift
//  TravelEasy
//
//  Created by zhuminxin on 2018/1/27.
//  Copyright © 2018年 Fang Zhang. All rights reserved.
//

import Foundation
import Toast_Swift
import SwiftyJSON
import Alamofire

func makeToast(view: UIView, message : String, duration : Float, point : CGPoint, title : String, image : UIImage?, style : ToastStyle)
{
    view.makeToast(message, duration: 1.0, point: point, title: title, image: image, style: style){ didTap in
        if didTap {
        } else {
        }
    }
}

func postAPI(param : Dictionary<String, Any>, apiURL : URL, completionHandler: @escaping (JSON?, NSError?) -> ())
{
    Alamofire.request(apiURL, method: .post, parameters: param, encoding:  URLEncoding.default, headers: nil).responseJSON { (response) in
        if(response.error == nil){
            completionHandler(JSON(response.result.value!), nil)
        }else{
            completionHandler(nil, response.error! as NSError)
        }
    }
}
