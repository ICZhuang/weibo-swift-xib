//
//  IWBStatusesViewController.swift
//  Weibo
//
//  Created by zhuangjl on 2017/5/23.
//  Copyright © 2017年 zhuangjl. All rights reserved.
//

import UIKit

let IWBStatusNormalCellId  = "IWBStatusNormalCellId"
let IWBStatusRetweetedCellId = "IWBStatusRetweetedCellId"

class IWBStatusesViewController: IWBBaseViewController {
    
    lazy var listViewModel = IWBStatusListViewModel()
    private var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        loadData()
    }
    
    func loadData() {
        IWBShowLoadingHUD(view: view)
        
        listViewModel.loadData { (success) in
            IWBHideLoadingHUD(view: self.view)
            
            if !success {
                IWBShowWarningHUD(view: self.view, text: "network unrechable")
            }else {
                self.tableView?.reloadData()
            }
        }
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView!)
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.separatorStyle = .none
        
//        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 300
        
        tableView?.register(UINib(nibName: "IWBStatusNormalCell", bundle: nil),
                            forCellReuseIdentifier: IWBStatusNormalCellId)
        tableView?.register(UINib(nibName: "IWBStatusRetweetedCell", bundle: nil),
                            forCellReuseIdentifier: IWBStatusRetweetedCellId)
    }
}

extension IWBStatusesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  listViewModel.statusList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = listViewModel.statusList[indexPath.row] as IWBStatusViewModel
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: (viewModel.status.retweeted_status != nil ? IWBStatusRetweetedCellId : IWBStatusNormalCellId),
            for: indexPath) as! IWBStatusCell
        
        cell.viewModel = viewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return listViewModel.statusList[indexPath.row].rowHeight
    }
}
