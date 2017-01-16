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
    @objc optional func reloadList(appList apps: [String : [AppModel]])
    @objc optional func appDetail(appDetail app: AppModel)
}

class Interactor {
    
    var delegate: InteractorDelegate?
    let dataManager = DataManager()
    
    func retrieveData() {
        self.dataManager.delegate = self
        self.dataManager.fetchApps()
    }
    
}

extension Interactor: DataManagerDelegate {
    func responseDataManager<T>(_ response: T) {
        if let listApps = response as? [AppModel], listApps.count > 0 {
            self.delegate?.reloadList!(appList: listApps.orderbyCategorys(apps: listApps))
        }
    }
}

extension Array {
    func orderbyCategorys(apps: [AppModel]) -> [String : [AppModel]] {
        var categorys: [String : [AppModel]] = [:]
        for app in apps{
            if categorys[app.category] != nil{
                var array = categorys[app.category]
                array!.append(app)
                categorys[app.category] = array
            } else {
                categorys.update(other: [app.category : [app]])
            }
        }
        return categorys
    }
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

extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
