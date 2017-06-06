//
//  UIImageView+Extension.swift
//  Weibo
//
//  Created by zhuangjl on 2017/6/3.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import SDWebImage

extension UIImageView {
    
    func iwb_setImage(urlString: String?, placeholderImage: UIImage?, isAvatar: Bool = false) {
        
        guard let urlString = urlString, let url = URL(string: urlString) else {
            image = placeholderImage
            return
        }
        
        sd_setImage(with: url,
                    placeholderImage: placeholderImage,
                    options: [],
                    progress: nil) { [weak self] /*weak*/ (image, _, _, _) in
            
            if isAvatar {
                self?.image = image?.iwb_avatarImage(size: self?.bounds.size)
            }
        }
    }
}
