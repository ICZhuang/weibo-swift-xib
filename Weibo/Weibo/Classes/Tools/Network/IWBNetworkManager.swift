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
    
    var access_token: String? = "2.00Sr38RGCNeKrB53a5e0e71f0jKVMY"
    
    func requestWithToken(method: IWBHTTPMethod = .IWBHTTPMethodGet, URLString: String,
                          parameters: [String : AnyObject]?, completion: @escaping (AnyObject?, Bool)->()) {
        
        guard let token = access_token else {
            completion(nil, false)
            return;
        }
        var parameters = parameters
        if parameters == nil {
            parameters = [String : AnyObject]()
        }
        
        parameters!["access_token"] = token as AnyObject;
        request(URLString: URLString, parameters: parameters, completion: completion);
    }
    
    func request(method: IWBHTTPMethod = .IWBHTTPMethodGet, URLString: String,
                 parameters: [String : AnyObject]?, completion: @escaping (AnyObject?, Bool)->()) {
        
        let success = { (task: URLSessionDataTask, json: Any?)->() in
            completion(json as AnyObject, true)
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
