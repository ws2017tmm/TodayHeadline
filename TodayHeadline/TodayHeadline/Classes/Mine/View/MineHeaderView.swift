//
//  MineHeaderView.swift
//  TodayHeadline
//
//  Created by StevenWu on 2019/11/27.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import UIKit

class MineHeaderView: UIView {
    
    weak var titleLabel: UILabel!
    weak var grayView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        let grayView = UIView()
        grayView.backgroundColor = UIColor(rgb: 245)
        self.addSubview(grayView)
        self.grayView = grayView
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
    }
    
    var title: String = "常用功能" {
        didSet {
            titleLabel.text = title
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        grayView.frame = CGRect(x: 0, y: 0, width: self.width, height: 10)
        
        titleLabel.width = 100
        titleLabel.height = 30
        titleLabel.x = 20
        titleLabel.y = (self.height-titleLabel.height) * 0.5 + 10
        
    }
    
}
