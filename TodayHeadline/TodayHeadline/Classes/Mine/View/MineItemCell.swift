//
//  MineItemCell.swift
//  TodayHeadline
//
//  Created by StevenWu on 2019/11/29.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import UIKit

public enum MineItemCellType: Int {
    case messageNoti = 1        // 消息通知
    case privateLetter          // 私信
    case collection             // 收藏
    case readHistory            // 阅读历史
    case wallet                 // 钱包
    case feedback               // 用户反馈
    case noTrafficService       // 免流量服务
    case systemSetting          // 系统设置
    case worksManagement        // 作品管理
    case superVip               // 超级会员
    case dreamCharity           // 圆梦公益
    case clearCache             // 清除缓存
    case comment                // 评论
    case thumbsUp               // 点赞
    case scan                   // 扫一扫
    case adPromotion            // 广告推广
}

class MineItemCell: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    var type: MineItemCellType!
    
    var itemModel: MineListItemModel? {
        didSet {
            titleLabel.text = itemModel?.title
//            tag = itemModel?.type ?? 0
            type = MineItemCellType(rawValue: itemModel?.type ?? 0)
            iconImageView.image = UIImage(named: itemModel?.img ?? "")
        }
    }
    
    class func loadXib() -> UIView {
        let view = Bundle.main.loadNibNamed("MineItemCell", owner: nil, options: nil)?.last as! MineItemCell
        return view;
    }

}
