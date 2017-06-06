//
//  IWBStatusCell.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/31.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit

class IWBStatusCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var menbershipIconView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var vipIconView: UIImageView!
    @IBOutlet weak var toolBar: IWBStatusToolBar!
    @IBOutlet weak var pictureView: IWBStatusPictureView!
    @IBOutlet weak var retweetedContentLabel: UILabel? // retweet status owner, use optional '?' 
    
    var viewModel: IWBStatusViewModel? {
        didSet {
            contentLabel.text = viewModel?.status.text
            nicknameLabel.text = viewModel?.status.user?.screen_name
            menbershipIconView.image = viewModel?.memberIcon
            vipIconView.image = viewModel?.vipIcon
            toolBar.viewModel = viewModel
            avatarImageView.iwb_setImage(urlString: viewModel?.status.user?.profile_image_url,
                                         placeholderImage: nil,
                                         isAvatar: true)
            pictureView.viewModel = viewModel;
            pictureView.urls = viewModel?.picURLs
            retweetedContentLabel?.text = viewModel?.retweetedContent
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.drawsAsynchronously = true
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
