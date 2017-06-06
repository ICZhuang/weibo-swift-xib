//
//  MBProgressHUD+Extension.swift
//  Weibo
//
//  Created by zhuangjl on 2017/6/1.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit
import MBProgressHUD

let IWBHUDDisplayDuration = 2.0

extension MBProgressHUD {
    
    class func hud(showAddTo view: UIView) {
        let _ = hud(showAddedTo: view)
    }
    
    class func hud(hideFor view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    class func hud(showAddedTo view: UIView) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.bezelView.backgroundColor = UIColor.black
        hud.contentColor = UIColor.white
        return hud
    }
    
    class func hud(showAddTo view: UIView, with text: String) {
        let _hud = hud(showAddedTo: view)
        _hud.offset = CGPoint(x: 0.0, y: 80.0)
        _hud.mode = .text
        _hud.label.text = text
        _hud.hide(animated: true, afterDelay: IWBHUDDisplayDuration)
    }
}
