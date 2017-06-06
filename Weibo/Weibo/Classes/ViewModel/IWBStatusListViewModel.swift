//
//  IWBStatusListViewModel.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/24.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import Foundation
import SDWebImage

class IWBStatusListViewModel {
    
    lazy var statusList = [IWBStatusViewModel]()
    
    func loadData(completion: @escaping (_ success: Bool)->()) {
        IWBNetworkManager.shared.statusList { (list, success) in
            
            var array = [IWBStatusViewModel]()
            for dict in list ?? [] {
                guard let status = IWBStatus.yy_model(with: dict) else {
                    continue
                }
                array.append(IWBStatusViewModel(model: status))
            }
            self.statusList += array
            self.storeSingleStatusImage(list: array, completion: completion)
        }
    }
    
    private func storeSingleStatusImage(list: [IWBStatusViewModel],
                                        completion: @escaping (_ success: Bool)->()) {
        let group = DispatchGroup()
        
        for vm in list {
            if vm.picURLs?.count != 1 {
                continue
            }
            
            guard let pic = vm.picURLs!.first?.thumbnail_pic,
                let url = URL(string: pic) else {
                continue
            }
            
            group.enter()
            
            SDWebImageManager.shared().downloadImage(with: url,options: [],progress: nil,completed: { (image, _, _, _, _) in
                if let image = image {
                    vm.updatePictureViewSize(image: image)
                }
                group.leave()
            })
        }
        
        group.notify(queue: DispatchQueue.main) { 
            completion(true)
        }
    }
}
