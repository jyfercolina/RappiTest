//
//  NetworkService.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/13/17.
//
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift
import SystemConfiguration


class NetworkDataServices {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
        
    }
    
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
