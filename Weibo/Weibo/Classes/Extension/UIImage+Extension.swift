//
//  UIImage+Extension.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/31.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit

extension UIImage {
    
    func iwb_avatarImage(size: CGSize?,
                         backgroundColor: UIColor = UIColor.white,
                         lineColor: UIColor = UIColor.lightGray) -> UIImage? {
        
        var size = size
        if size == nil {
            size = self.size
        }
        let rect = CGRect(origin: CGPoint(), size: size!)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        backgroundColor.setFill()
        UIRectFill(rect)
        
        let clipPath = UIBezierPath(ovalIn: rect)
        clipPath.addClip()
        
        draw(in: rect)
        
        let borderPath = UIBezierPath(ovalIn: rect)
        borderPath.lineWidth = 1.0
        lineColor.setStroke()
        borderPath.stroke()
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    
}
