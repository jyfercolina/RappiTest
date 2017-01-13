//
//  NetworkService.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/13/17.
//
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift


class NetworkDataServices {
    
    static func fetchArrayData <T: Object> (url : String, type: T.Type, success:@escaping (_ result: [T]) -> Void, fail:@escaping (_ error:NSError)->Void)->Void where T:Mappable {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:]).responseJSON { response in
            switch response.result {
            case .success:
                guard let json = response.result.value as? [String: Any], let feed = json["feed"] as? [String : AnyObject], let entry = feed["entry"] as? [AnyObject]
                    else{
                        return
                }
                if let data = Mapper<T>().mapArray(JSONObject: entry){
                    success(data)
                }
            case .failure(let error):
                fail(error as NSError)
            }
        }
    }
}
