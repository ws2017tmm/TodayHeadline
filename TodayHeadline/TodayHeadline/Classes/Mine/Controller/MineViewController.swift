//
//  MineViewController.swift
//  TodayHeadline
//
//  Created by StevenWu on 2019/11/22.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import UIKit
import ObjectMapper

let MineTitleCellID = "MineTitleCell"
let MineListCellID = "MineListCell"
let MineListAuthorCellID = "MineListAuthorCell"


//MARK: - 生命周期
class MineViewController: BaseViewController {
    
    let titleList = ["data": [
            [
                "sectionTitle":"常用功能",
                "section":[
                    ["title":"消息通知", "img":"chatroom_keyboard_28x28_", "type":1],
                    ["title":"私信", "img":"chatroom_keyboard_28x28_", "type":2],
                    ["title":"收藏", "img":"chatroom_keyboard_28x28_", "type":3],
                    ["title":"阅读历史", "img":"chatroom_keyboard_28x28_", "type":4]
                ]
            ],
            [
                "sectionTitle":"",
                "section":[
                    ["title":"钱包", "img":"chatroom_keyboard_28x28_", "type":5],
                    ["title":"用户反馈", "img":"chatroom_keyboard_28x28_", "type":6],
                    ["title":"免流量服务", "img":"chatroom_keyboard_28x28_", "type":7],
                    ["title":"系统设置", "img":"chatroom_keyboard_28x28_", "type":8]
                ]
            ],
            [
                "sectionTitle":"作者工具",
                "section":[
                    ["title":"作品管理", "img":"chatroom_keyboard_28x28_", "type":9]
                ]
            ],
            [
                "sectionTitle":"更多功能",
                "section": [
                     ["title":"超级会员", "img":"chatroom_keyboard_28x28_", "type":10],
                     ["title":"圆梦公益", "img":"chatroom_keyboard_28x28_", "type":11],
                     ["title":"清除缓存", "img":"chatroom_keyboard_28x28_", "type":12],
                     ["title":"夜间模式", "img":"chatroom_keyboard_28x28_", "type":13]
                 ]
            ],
            [
                "sectionTitle":"",
                "section": [
                     ["title":"评论", "img":"chatroom_keyboard_28x28_", "type":14],
                     ["title":"点赞", "img":"chatroom_keyboard_28x28_", "type":15],
                     ["title":"扫一扫", "img":"chatroom_keyboard_28x28_", "type":16],
                     ["title":"广告推广", "img":"chatroom_keyboard_28x28_", "type":17]
                 ]
            ]
        ]
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor(rgb: 245)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 10))
        
        // 注册cell
        tableView.register(UINib(nibName: MineTitleCellID, bundle: nil), forCellReuseIdentifier: MineTitleCellID)
        tableView.register(MineListCell.self, forCellReuseIdentifier: MineListCellID)
        
        
        return tableView
    }()
    
    var mineDataList: [MineListCellModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        // 解析数据
        do {
            try mineDataList = Mapper<MineListCellModel>().mapArray(JSONArray: titleList["data"] ?? [])
        } catch let error {
            print(error)
        }
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.contentInset = UIEdgeInsets(top: -500, left: 0, bottom: -10, right: 0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}

//MARK: - 初始化
extension MineViewController {
    private func setupUI() {
        view.backgroundColor = UIColor(rgb: 245)
        view.addSubview(tableView)
    }
}

//MARK: - UITableViewDataSource
extension MineViewController: UITableViewDataSource {
    ///  一共多少组
    func numberOfSections(in tableView: UITableView) -> Int {
        return mineDataList.count + 1
    }
    /// 每组多少个
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    /// 每个cell怎么显示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MineTitleCellID, for: indexPath) as! MineTitleCell
            cell.applyCertification = { (a, b) in
                self.applicationForCertification()
            }
            cell.mineDetail = { (a, b) in
                self.gotoMineDetailVC()
            }
            return cell
        } else {
            let model = mineDataList[indexPath.section-1]
            let cell = tableView.dequeueReusableCell(withIdentifier: MineListCellID, for: indexPath) as! MineListCell
            cell.model = model
            cell.delegate = self
            return cell
        }
    }
}


//MARK: - UITableViewDelegate
extension MineViewController: UITableViewDelegate {
    // 每个cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 600
        } else {
            return 100
        }
    }
    
    //
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 3 || section == 4 {
            return 60
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = mineDataList[section-1]
        let headerView = MineHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.width, height: 60))
        headerView.title = model.sectionTitle ?? ""
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 1 || section == 4 {
            return 0.5
        } else if section == mineDataList.count {
            return 10
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.backgroundColor = UIColor(rgb: 245)
        return view
    }
    
}

//MARK: - cell回传事件
extension MineViewController {
    /// 申请认证
    private func applicationForCertification() {
        print("申请认证")
    }
    
    /// 个人信息详情
    private func gotoMineDetailVC() {
        print("个人信息详情")
    }
}

//MARK: - itemCell点击的代理
extension MineViewController: MineListCellDelegate {
    func mineItemCell(_ itemCell: MineItemCell, didSelectedItem itemModel: MineListItemModel) {
        
        switch itemCell.type {
        case .messageNoti:                  // 消息通知
            print("messageNoti")
        case .privateLetter:                // 私信
            print("privateLetter")
        case .collection:                   // 收藏
            print("collection")
        case .readHistory:                  // 阅读历史
            print("readHistory")
        case .wallet:                       // 钱包
            print("wallet")
        case .feedback:                     // 用户反馈
            print("feedback")
        case .noTrafficService:             // 免流量服务
            print("noTrafficService")
        case .systemSetting:                // 系统设置
            print("privateLetter")
        case .worksManagement:              // 作品管理
            print("worksManagement")
        case .superVip:                     // 超级会员
            print("superVip")
        case .dreamCharity:                 // 圆梦公益
            print("dreamCharity")
        case .clearCache:                   // 清除缓存
            print("clearCache")
        case .nightMode:                    // 夜间模式
            print("nightMode")
            nightMode()
        case .comment:                      // 评论
            print("comment")
        case .thumbsUp:                     // 点赞
            print("thumbsUp")
        case .scan:                         // 扫一扫
            print("scan")
        case .adPromotion:                  // 广告推广
            print("adPromotion")
        default:
            print("none")
        }
    }
    
}

