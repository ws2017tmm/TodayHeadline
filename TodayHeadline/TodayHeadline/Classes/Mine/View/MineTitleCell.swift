//
//  MineTitleCell.swift
//  TodayHeadline
//
//  Created by 李响 on 2019/11/27.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import UIKit

class MineTitleCell: UITableViewCell {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var headlinesLabel: UILabel!
    @IBOutlet weak var followLabel: UILabel!
    @IBOutlet weak var fansLabel: UILabel!
    
    @IBOutlet weak var authButton: UIButton!
    
    @IBAction func applicationForCertification() {
        print("申请认证")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(headerImageView.height)
        headerImageView.layer.cornerRadius = headerImageView.height * 0.5
        headerImageView.layer.masksToBounds = true
        
        authButton.setConcer(radius: authButton.height * 0.5, byRoundingCorners: [.topLeft, .bottomLeft])
    }
    
    
}

