//
//  IWBStatusViewModel.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/31.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit

let IWBStatusPictureViewOutterMagin = CGFloat(12)
let IWBStatusPictureViewInnerMargin = CGFloat(3)

let IWBStatusPictureViewWidth = UIScreen.main.bounds.size.width - IWBStatusPictureViewOutterMagin * 2
let IWBStatusPictureItemWidth = (IWBStatusPictureViewWidth - 2 * IWBStatusPictureViewInnerMargin) / 3

let IWBAvatarIconHeight = CGFloat(34)
let IWBStatusToolBarHeight = CGFloat(38)

let IWBContentLabelFont = UIFont.systemFont(ofSize: 16)
let IWBRetweetedContentLabelFont = UIFont.systemFont(ofSize: 15)

class IWBStatusViewModel: CustomStringConvertible {
    
    var status: IWBStatus
    
    var memberIcon: UIImage?
    
    var vipIcon: UIImage?
    
    var reportsButtonTitle: String?
    
    var commentsButtonTitle: String?
    
    var attitudesButtonTitle: String?
    
    var pictureViewSize = CGSize()
    
    var picURLs: [IWBStatusPicture]? {
        return status.retweeted_status?.pic_urls ?? status.pic_urls
    }
    
    var retweetedContent: String?
    
    var rowHeight: CGFloat = 0
    
    init(model: IWBStatus) {
        self.status = model
        
        if (model.user?.mbrank)! > 0 && (model.user?.mbrank)! < 7 {
            memberIcon = UIImage(named: "common_icon_membership_level\(status.user?.mbrank ?? 1)")
        }
        
        switch model.user?.verified_type ?? -1 {
        case 0:
            vipIcon = UIImage(named: "avatar_vip")
        case 2, 3, 5:
            vipIcon = UIImage(named: "avatar_enterprise_vip")
        case 220:
            vipIcon = UIImage(named: "avatar_grassroot")
        default:
            break
        }
        
        reportsButtonTitle = buttonTitle(count: model.reposts_count, usedefault: "转发")
        commentsButtonTitle = buttonTitle(count: model.comments_count, usedefault: "评论")
        attitudesButtonTitle = buttonTitle(count: model.attitudes_count, usedefault: "赞")
        
        pictureViewSize = calcPictureViewSize(count: picURLs?.count)
        
        retweetedContent = "@"
            + (model.retweeted_status?.user?.screen_name ?? "")
            + "："
            + (model.retweeted_status?.text ?? "")
        
        updateRowHeight()
    }
    
    private func buttonTitle(count: Int, usedefault: String) -> String {
        if count <= 0 {
            return usedefault;
        }else if count < 10000 {
            return count.description
        }else {
            return String(format: "%.02f万", Double(count) / 10000)
        }
    }
    
    private func updateRowHeight() {
        let IWBLabelBoundingSize = CGSize(width: UIScreen.main.bounds.size.width - 2 * IWBStatusPictureViewOutterMagin,
                                          height: CGFloat(MAXFLOAT))
        var height: CGFloat = 0
        
        height = 3 * IWBStatusPictureViewOutterMagin + IWBAvatarIconHeight
        
        if let text = status.text {
            height += (text as NSString).boundingRect(with: IWBLabelBoundingSize,
                                                      options: [.usesLineFragmentOrigin],
                                                      attributes: [NSFontAttributeName : IWBContentLabelFont],
                                                      context: nil).height
        }
        
        if status.retweeted_status != nil {
            height += 2 * IWBStatusPictureViewOutterMagin
            
            if let text = retweetedContent {
                height += (text as NSString).boundingRect(with: IWBLabelBoundingSize,
                                                          options: [.usesLineFragmentOrigin],
                                                          attributes: [NSFontAttributeName : IWBRetweetedContentLabelFont],
                                                          context: nil).height
            }
        }

        height += pictureViewSize.height
        height += IWBStatusPictureViewOutterMagin + IWBStatusToolBarHeight
        rowHeight = height
    }
    
    func updatePictureViewSize(image: UIImage) {
        var size = image.size
        size.height += IWBStatusPictureViewOutterMagin
        pictureViewSize = size
        updateRowHeight()
    }
    
    private func calcPictureViewSize(count: Int?) -> CGSize {
        
        if count == 0 || count == nil {
            return CGSize()
        }
        
        let rows = CGFloat((count! - 1) / 3 + 1)
        
        let height = IWBStatusPictureViewOutterMagin
            + rows * IWBStatusPictureItemWidth
            + IWBStatusPictureViewInnerMargin * (rows - 1)
        
        return CGSize(width: IWBStatusPictureViewWidth, height: height)
    }
    
    var description: String {
        return status.description
    }
}
