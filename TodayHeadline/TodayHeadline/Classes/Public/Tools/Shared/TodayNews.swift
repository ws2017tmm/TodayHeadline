//
//  TodayNews.swift
//  TodayHeadline
//
//  Created by 李响 on 2019/12/2.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import Foundation

class TodayNews: NSObject {
    // 单例
    static let share = TodayNews()
    // 夜间模式
    var isNight = false
    
}
