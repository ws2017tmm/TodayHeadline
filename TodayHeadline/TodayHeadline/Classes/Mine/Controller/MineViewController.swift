//
//  MineViewController.swift
//  TodayHeadline
//
//  Created by StevenWu on 2019/11/22.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import UIKit

let MineTitleCellID = "MineTitleCell"
let MainListCellID = "MainListCell"

class MineViewController: UITableViewController {
    
    let headerList = ["常用功能", "作者工具", "更多功能"]
    let titleList = [
        ["消息通知", "私信", "收藏", "阅读历史", "钱包", "用户反馈", "免流量服务", "系统设置"],
        ["作品管理"],
        ["超级会员", "圆梦公益", "清除缓存", "夜间模式", "评论", "点赞", "扫一扫", "广告推广"]
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 245)
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        // 注册cell
        tableView.register(UINib(nibName: MineTitleCellID, bundle: nil), forCellReuseIdentifier: MineTitleCellID)
        tableView.register(UINib(nibName: MainListCellID, bundle: nil), forCellReuseIdentifier: MainListCellID)
        
        
//        WSNetworkProvider.shared.requestData(target: HomeApi.tabs, success: { (response) in
//            print(response)
//        }) { (error) in
//            print(error ?? "error")
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.contentInset = UIEdgeInsets(top: -300, left: 0, bottom: 0, right: 0)
    }
    
}

//MARK: - UITableViewDataSource
extension MineViewController {
    ///  一共多少组
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    /// 每组多少个
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    /// 每个cell怎么显示
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if indexPath.section==0 {
            cell = tableView.dequeueReusableCell(withIdentifier: MineTitleCellID, for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: MainListCellID, for: indexPath)
        }
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MineViewController {
    // 每个cell的高度
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 400
        }
        return 200
    }
    
    //
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 60
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MineHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.width, height: 60))
        headerView.title = headerList[section-1]
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == headerList.count {
            return 10
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 10))
        view.backgroundColor = UIColor(rgb: 245)
        return view
    }
    
}
