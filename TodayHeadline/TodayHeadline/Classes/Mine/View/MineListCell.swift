//
//  MineListCell.swift
//  TodayHeadline
//
//  Created by StevenWu on 2019/11/27.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import UIKit

protocol MineListCellDelegate : NSObjectProtocol {
    func mineItemCell(_ itemCell: MineItemCell, didSelectedItem itemModel: MineListItemModel)
}

class MineListCell: UITableViewCell {
    
    weak var delegate: MineListCellDelegate?
    var model: MineListCellModel? {
        willSet {
            if newValue != nil && model?.sectionTitle != newValue?.sectionTitle {
                if self.contentView.subviews.count > 0 { self.contentView.subviews.forEach({
                        $0.removeFromSuperview()
                    })
                }
                guard let section = newValue?.section else {
                    return
                }
                for model in section {
                    let cellItem = MineItemCell.loadXib() as! MineItemCell
                    cellItem.itemModel = model
                    
                    let tapGes = UITapGestureRecognizer(target: self, action: #selector(itemClicked))
                    cellItem.addGestureRecognizer(tapGes)
                    
                    self.contentView.addSubview(cellItem)
                }
            }
        }
    }
    
    @objc func itemClicked(_ tapGes: UITapGestureRecognizer) {
        let itemCell = tapGes.view as! MineItemCell
        let itemModel = itemCell.itemModel!
        delegate?.mineItemCell(itemCell, didSelectedItem: itemModel)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.contentView.width * 0.25;
        let height = self.contentView.height
        for i in 0..<self.contentView.subviews.count {
            let view = self.contentView.subviews[i]
            if view.isKind(of: MineItemCell.self) {
                let x = CGFloat(i) * width
                view.frame = CGRect(x: x, y: 0, width: width, height: height)
            }
        }
    }
    
}
