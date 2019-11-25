//
//  TabBarViewController.swift
//  TodayHeadline
//
//  Created by 李响 on 2019/11/22.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置tabBarItem文字和图片的属性
        setupTabBar()
        tabBar.tintColor = UIColor(r: 240, g: 92, b: 95)
        
        // 设置子控制器
        setupChildController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(1111)
         let vc = UIStoryboard(name: "Launch Screen", bundle: nil).instantiateViewController(withIdentifier: "LaunchScreen")
        
        guard let launchView = vc.view else {
            return
        }
        let window = UIApplication.shared.keyWindow
        launchView.frame = UIScreen.main.bounds
        window?.addSubview(launchView)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .beginFromCurrentState, animations: {
            launchView.alpha = 0
            launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 2.0, 2.0, 1.0)
        }) { (finished) in
            launchView.removeFromSuperview()
        }
        
    }
    
}

extension TabBarController {
    // 设置tabBar颜色
    private func setupTabBar() {
       // 普通状态
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor(rgb: 30), .font: UIFont.systemFont(ofSize: 14)], for: .normal)
       // 选中状态
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor(r: 240, g: 92, b: 95), .font: UIFont.systemFont(ofSize: 14)], for: .selected)
    }
    
    // 设置子控制器
    private func setupChildController() {
        // 首页
        let homeVC = addChildVC(vc: HomeViewController(), title: "首页", normal: "home_tabbar_night_32x32_", selected: "home_tabbar_press_32x32_")
        
        // 火山
        let volcanoVC = addChildVC(vc: HomeViewController(), title: "火山", normal: "huoshan_tabbar_night_32x32_", selected: "huoshan_tabbar_press_32x32_")
        
        // 视频
        let videoVC = addChildVC(vc: HomeViewController(), title: "视频", normal: "video_tabbar_night_32x32_", selected: "video_tabbar_press_32x32_")
        
        // 我的
        let mineVC = addChildVC(vc: HomeViewController(), title: "我的", normal: "mine_tabbar_night_32x32_", selected: "mine_tabbar_press_32x32_")
        
        viewControllers = [homeVC, volcanoVC, videoVC, mineVC];
    }
    
    func addChildVC(vc: UIViewController, title: String, normal normalImage: String, selected selectedImage: String) -> UIViewController {
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: normalImage)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)
        
        let navVC = NavigationController(rootViewController: vc)
        
        return navVC
    }
}
