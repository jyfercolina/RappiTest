//
//  UserModel.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/12/17.
//
//

import Foundation
import ObjectMapper
import RealmSwift

class UserModel: Object {
    
    dynamic var email: String = ""
    dynamic var name: String = ""
    let apps = List<AppModel>()
    
    override static func primaryKey() -> String? {
        return "email"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}

extension UserModel : Mappable {
    func mapping(map: Map) {
        email <- map["email"]
        name <- map["name"]
    }
}

