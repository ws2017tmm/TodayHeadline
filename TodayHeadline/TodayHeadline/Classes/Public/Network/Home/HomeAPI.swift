//
//  HomeAPI.swift
//  TodayHeadline
//
//  Created by StevenWu on 2019/11/26.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import Foundation
import Moya

enum HomeApi {
    case tabs               //分类推荐列表
    case liveCateList       //分类列表
    case getRecList1        // 热门推荐
}

extension HomeApi: API {
    // 请求路径
    var path: String {
        switch self {
        case .tabs:
            return "/user/tab/tabs"
        case .liveCateList:
            return "/live/cate/getLiveCate1List"
        case .getRecList1:
            return "/mgapi/livenc/home/getRecList1"
        }
    }
    
    // 请求类型
    var method: Moya.Method {
        switch self {
        case .tabs:
            return .get
        case .liveCateList:
            return .get
        case.getRecList1:
            return .post
        }
    }
//    https://is.snssdk.com/user/tab/tabs/?device_id=6096495334
    // 请求参数
    var task: Task {
        var params: [String: Any] = ["device_id": device_id]
        switch self {
        case .tabs:
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .liveCateList:
            params["client_sys"] = "ios"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .getRecList1:
            params["client_sys"] = "ios"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
}
