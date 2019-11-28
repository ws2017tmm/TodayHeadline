//
//  API.swift
//  TodayHeadline
//
//  Created by 李响 on 2019/11/26.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import Foundation
import Moya

//open,public,interal,fileprivate,private
let device_id: Int = 6096495334

protocol API: TargetType {}

extension API {
    // 基础路径
    var baseURL: URL {
        return URL(string: "https://is.snssdk.com")!
    }
    
    // 用于单元测试(暂时忽略)
    var sampleData: Data {
        return Data(base64Encoded: "just for test")!
    }
    
    // 请求头
    var headers: [String : String]? {
        return [
            "Content-Type" : "application/x-www-form-urlencoded"
        ]
    }
}
