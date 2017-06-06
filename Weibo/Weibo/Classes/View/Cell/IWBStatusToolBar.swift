//
//  IWBStatusToolBar.swift
//  Weibo
//
//  Created by zhuangjl on 2017/6/3.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit

class IWBStatusToolBar: UIView {

    @IBOutlet weak var reportsButton: UIButton?
    @IBOutlet weak var commentsButton: UIButton?
    @IBOutlet weak var attitudesButton: UIButton?
    
    var viewModel: IWBStatusViewModel? {
        didSet {
            reportsButton?.setTitle(viewModel?.reportsButtonTitle, for: [])
            commentsButton?.setTitle(viewModel?.commentsButtonTitle, for: [])
            attitudesButton?.setTitle(viewModel?.attitudesButtonTitle, for: [])
        }
    }
}
