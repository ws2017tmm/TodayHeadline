//
//  BaseViewController.swift
//  TodayHeadline
//
//  Created by 李响 on 2019/12/2.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    /// 黑夜模式的背景view
    var bgView: NightBgView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

}

//MARK: - Methods
extension BaseViewController {
    /// 开启黑夜模式
    func nightMode() {
        TodayNews.share.isNight = !TodayNews.share.isNight
        if TodayNews.share.isNight {
            bgView = NightBgView(frame: UIScreen.main.bounds)
            bgView?.backgroundColor = UIColor(rgb: 0, alpha: 0.5)
            let window = UIApplication.shared.keyWindow
            window?.addSubview(bgView!)
        } else {
            bgView?.removeFromSuperview()
        }
    }
    
}
