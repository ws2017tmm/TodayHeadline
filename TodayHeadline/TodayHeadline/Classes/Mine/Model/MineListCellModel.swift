//
//  File.swift
//  TodayHeadline
//
//  Created by StevenWu on 2019/11/28.
//  Copyright © 2019 StevenWu. All rights reserved.
//

import Foundation
import ObjectMapper

class MineListCellModel: ImmutableMappable {
    
    var sectionTitle: String?
    var section: [MineListItemModel]?
    
    required init(map: Map) throws {
        
    }
    
    func mapping(map: Map) {
        sectionTitle    <- map["sectionTitle"]
        section         <- map["section"]
    }
}

struct MineListItemModel: Mappable {
    var title : String?
    var img : String?
    var type : Int?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        title   <- map["title"]
        img     <- map["img"]
        type    <- map["type"]
    }
}
