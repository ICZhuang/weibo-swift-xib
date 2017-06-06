//
//  IWBUser.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/31.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit

class IWBUser: NSObject {
    
    var id: Int64 = 0
    
    var screen_name: String?
    
    var profile_image_url: String?
    
    var verified_type: Int = 0
    
    /// menbership:0~6
    var mbrank: Int = 0
    
    override var description: String {
        return yy_modelDescription()
    }
}
