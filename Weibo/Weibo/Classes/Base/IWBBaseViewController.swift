//
//  IWBBaseViewController.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/26.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit

class IWBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupInterface()
    }
    
    func setupInterface() {
        view.backgroundColor = UIColor.white
    }

}
