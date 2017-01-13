//
//  Interactor.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/13/17.
//
//

import Foundation
import RealmSwift

@objc protocol InteractorDelegate: class {
    @objc optional func successEvent(success : Bool)
    @objc optional func currentUser(currentUser user: UserModel)
    @objc optional func reloadList(appList apps: [AppModel])
    @objc optional func appDetail(appDetail app: AppModel)
}

class Interactor {

    
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}
