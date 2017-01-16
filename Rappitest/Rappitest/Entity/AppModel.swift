//
//  AppModel.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/12/17.
//
//

import Foundation
import ObjectMapper
import RealmSwift

class AppModel: Object {
    dynamic var name : String = ""
    dynamic var image : String = ""
    dynamic var summary : String = ""
    dynamic var price : Float = 0.0
    dynamic var contentType : String = ""
    dynamic var rights : String = ""
    dynamic var title : String = ""
    dynamic var link : String = ""
    dynamic var id : String = ""
    dynamic var artist : String = ""
    dynamic var category : String = ""
    dynamic var releaseDate : String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

extension AppModel: Mappable {
    func mapping(map: Map) {
        name <- map["im:name.label"]
        if let url = ((map["im:image"].currentValue as! [AnyObject])[2] as? [String : AnyObject]){
            image = url["label"] as! String
        }
        summary <- map["summary.label"]
        if let amount = (map["im:price.attributes"].currentValue as? [String : AnyObject]){
            price = Float(amount["amount"] as! String)!
        }
        contentType <- map["im:contentType.attributes.label"]
        rights <- map["rights.label"]
        title <- map["title.label"]
        link <- map["link.attributes.href"]
        id <- map["id.attributes.im:id"]
        artist <- map["im:artist.label"]
        category <- map["category.attributes.label"]
        releaseDate <- map["im:releaseDate.attributes.label"]
    }
}
