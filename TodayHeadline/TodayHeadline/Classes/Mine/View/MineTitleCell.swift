//
//  MineTitleCell.swift
//  TodayHeadline
//
//  Created by StevenWu on 2019/11/27.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import UIKit

typealias myBlock = (_ a: Int, _ b: Int) -> Void

class MineTitleCell: UITableViewCell {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var subTitleView: UIView!
    @IBOutlet weak var headlinesLabel: UILabel!
    @IBOutlet weak var followLabel: UILabel!
    @IBOutlet weak var fansLabel: UILabel!
    @IBOutlet weak var authButton: UIButton!
    
    var applyCertification: myBlock?
    var mineDetail: myBlock?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        headerImageView.isUserInteractionEnabled = true
        nicknameLabel.isUserInteractionEnabled = true
        
        let ges1 = UITapGestureRecognizer(target: self, action: #selector(gotoMineDeatil))
        headerImageView.addGestureRecognizer(ges1)
        
        let ges2 = UITapGestureRecognizer(target: self, action: #selector(gotoMineDeatil))
        nicknameLabel.addGestureRecognizer(ges2)
        
        let ges3 = UITapGestureRecognizer(target: self, action: #selector(gotoMineDeatil))
        subTitleView.addGestureRecognizer(ges3)
    }
    
    /// 申请认证
    @IBAction func applicationForCertification() {
        guard let applyCertification = applyCertification else {
            return
        }
        applyCertification(1, 2)
    }
    
    /// 跳转到个人信息的详情页
    @objc private func gotoMineDeatil() {
        guard let mineDetail = mineDetail else {
            return
        }
        mineDetail(3, 4)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        headerImageView.layer.cornerRadius = headerImageView.height * 0.5
        headerImageView.layer.masksToBounds = true
        
        authButton.setConcer(radius: authButton.height * 0.5, byRoundingCorners: [.topLeft, .bottomLeft])
    }
    
}

