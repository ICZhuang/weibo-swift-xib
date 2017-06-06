//
//  IWBStatus.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/24.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit
import YYModel

class IWBStatus: NSObject {
    
    var id: Int64 = 0
    
    var text: String?
    
    var user: IWBUser?
    
    var reposts_count: Int = 0
    
    var comments_count: Int = 0
    
    var attitudes_count: Int = 0
    
    var pic_urls: [IWBStatusPicture]?
    
    var retweeted_status: IWBStatus?
    
    class func modelContainerPropertyGenericClass() -> [String : AnyClass] {
        return ["pic_urls" : IWBStatusPicture.self]
    }
    
    override var description: String {
        return yy_modelDescription()
    }
}
