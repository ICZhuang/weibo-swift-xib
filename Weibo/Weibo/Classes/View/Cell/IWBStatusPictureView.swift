//
//  IWBStatusPictureView.swift
//  Weibo
//
//  Created by zhuangjl on 2017/6/3.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit

class IWBStatusPictureView: UIView {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        setupPictureView()
    }
    
    var viewModel: IWBStatusViewModel? {
        didSet {
            if viewModel?.picURLs?.count == 1 {
                let size = viewModel?.pictureViewSize ?? CGSize()
                subviews[0].frame = CGRect(x: 0,
                                           y: IWBStatusPictureViewOutterMagin,
                                           width: size.width,
                                           height: size.height - IWBStatusPictureViewOutterMagin)
            }else {
                subviews[0].frame = CGRect(x: 0,
                                           y: IWBStatusPictureViewOutterMagin,
                                           width: IWBStatusPictureItemWidth,
                                           height: IWBStatusPictureItemWidth)
            }
            heightConstraint.constant = viewModel?.pictureViewSize.height ?? 0
        }
    }
    
    var urls: [IWBStatusPicture]? {
        didSet {
            for v in subviews {
                v.isHidden = true
            }
            
            var imageView: UIImageView?
            var index = 0
            
            for url in urls ?? [] {
                imageView = subviews[index] as? UIImageView
                
                if index == 1 && urls?.count == 4 {
                    index += 1
                }
                
                imageView?.iwb_setImage(urlString: url.thumbnail_pic, placeholderImage: nil)
                imageView?.isHidden = false
                
                index += 1
            }
        }
    }
}

extension IWBStatusPictureView {
    
    func setupPictureView() {
        
        backgroundColor = superview?.backgroundColor
        clipsToBounds = true
        
        let count = 3
        var row = CGFloat(0)
        var col = CGFloat(0)
        
        let rect = CGRect(x: 0,
                          y: IWBStatusPictureViewOutterMagin,
                          width: IWBStatusPictureItemWidth,
                          height: IWBStatusPictureItemWidth)
        
        for index in 0..<count * count {
            
            row = CGFloat(index / 3)
            col = CGFloat(index % 3)
            
            let n = IWBStatusPictureItemWidth + IWBStatusPictureViewInnerMargin
            
            let imageView = UIImageView(frame: rect.offsetBy(dx: n * col, dy: n * row))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            
            addSubview(imageView);
        }
    }
}
