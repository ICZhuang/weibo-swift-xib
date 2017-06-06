//
//  IWBNetworkManager+Extension.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/23.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import Foundation

extension IWBNetworkManager {
    
    func statusList(completion: @escaping (_ statuses: [[String : AnyObject]]?, _ success: Bool)->()) {
        let URLString = "https://api.weibo.com/2/statuses/home_timeline.json"
    
        requestWithToken(URLString: URLString, parameters: nil) { (json, success) in
            let result = json?["statuses"] as? [[String : AnyObject]]
            completion(result, success)
        }
    }
}
