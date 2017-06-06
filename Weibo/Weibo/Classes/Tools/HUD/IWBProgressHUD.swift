//
//  IWBProgressHUD.swift
//  Weibo
//
//  Created by zhuangjl on 2017/6/1.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit
import MBProgressHUD

public func IWBShowLoadingHUD(view: UIView) {
    MBProgressHUD.hud(showAddTo: view)
}

public func IWBHideLoadingHUD(view: UIView) {
    MBProgressHUD.hud(hideFor: view)
}

public func IWBShowWarningHUD(view: UIView, text: String) {
    MBProgressHUD.hud(showAddTo: view, with: text)
}
