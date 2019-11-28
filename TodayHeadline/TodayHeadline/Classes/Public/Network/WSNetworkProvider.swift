//
//  WSNetworkProvider.swift
//  TodayHeadline
//
//  Created by StevenWu on 2019/11/25.
//  Copyright © 2019 StevenWu. All rights reserved.
//

//import Foundation
import UIKit
import Moya
import Result
import SwiftyJSON
import ObjectMapper

///成功
typealias SuccessStringClosure = (_ result: String) -> Void
typealias SuccessModelClosure = (_ result: Mappable?) -> Void
typealias SuccessArrModelClosure = (_ result: [Mappable]?) -> Void
typealias SuccessJSONClosure = (_ result:JSON) -> Void
/// 失败
typealias FailClosure = (_ errorMsg: String?) -> Void

public class WSNetworkProvider {
    
    static let shared = WSNetworkProvider()
    private let failInfo = "数据解析失败"
    
    func requestData<T: TargetType>(target: T, success: @escaping SuccessJSONClosure, failure: @escaping FailClosure) {
        
        let requestProvider = MoyaProvider<T>(requestClosure:requestTimeoutClosure(target: target))
        
        let _ = requestProvider.request(target) { (result) -> () in
            switch result {
            case let .success(response):
                do {
                    let mapjson = try response.mapJSON()
                    let json = JSON(mapjson)
                    guard let _ = json.dictionaryObject else {
                        failure(self.failInfo)
                        return
                    }
                    success(json["data"])
                } catch {
                    failure(self.failInfo)
                }
            case let .failure(error):
                failure(error.errorDescription)
            }
        }
        
    }
    
//    //MARK: - 设置请求头
//    func requestHeaderClosure<T: TargetType>(target: T) -> MoyaProvider<T>.EndpointClosure {
//
//        let myEndpointClosure = {(target:T) -> Endpoint in
//            let url = target.baseURL.appendingPathComponent(target.path).absoluteString
//
//            let endpoint = Endpoint(url: url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
//
//            return endpoint.adding(newHTTPHeaderFields: [
////                "Content-Type" : "application/x-www-form-urlencoded",
////                "ECP-COOKIE" : ""
//                :
//            ])
//        }
//        return myEndpointClosure
//    }
    
    //MARK: - 设置超时时间
    func requestTimeoutClosure<T: TargetType>(target: T) -> MoyaProvider<T>.RequestClosure {
        
        let requestTimeoutClosure = { (endpoint:Endpoint, done: @escaping MoyaProvider<T>.RequestResultClosure) in
            do{
                var request = try endpoint.urlRequest()
                request.timeoutInterval = 15 //设置请求超时时间
                done(.success(request))
            }catch{
                return
            }
        }
        return requestTimeoutClosure
    }
    
}
