//
//  IWBNetworkManager.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/11.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit
import AFNetworking

enum IWBHTTPMethod {
    case IWBHTTPMethodGet
    case IWBHTTPMethodPost
}

class IWBNetworkManager: AFHTTPSessionManager {
    // singleton
    static let shared = IWBNetworkManager()
    
    func reuqest(method: IWBHTTPMethod, URLString: String, parameters: [String : AnyObject],
                 completion: @escaping (Any?, Bool)->()) {
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
            completion(json, true)
        }
        let failure = { (task: URLSessionDataTask?, error: Error)->() in
            completion(nil, false)
        }
        if method == .IWBHTTPMethodGet {
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }else {
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
}
