//
//  Interactor.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/13/17.
//
//

import Foundation
import RealmSwift

// MARK: InteractorDelegate - Protocol
@objc protocol InteractorDelegate: class {
    @objc optional func successEvent(success : Bool)
    @objc optional func installed(result : Bool)
    @objc optional func currentUser(currentUser user: UserModel)
    @objc optional func reloadList(appList apps: [String : [AppModel]])
}

class Interactor {
    
    var delegate: InteractorDelegate?
    let dataManager = DataManager()
    
    func retrieveData() {
        self.dataManager.delegate = self
        self.dataManager.fetchApps()
    }
    
    func retrieveCurrentUser() {
        self.dataManager.delegate = self
        self.dataManager.fetchUserData()
    }
    
    func installedApp(app: AppModel) {
        self.dataManager.delegate = self
        self.dataManager.filterApp(app: app)
    }
    
    func installApp(app: AppModel) {
        self.dataManager.delegate = self
        self.dataManager.saveAppInstall(app: app)
    }
    
}

// MARK: Interactor - DataManagerDelegate.
extension Interactor: DataManagerDelegate {
    func responseDataManager<T>(_ response: T) {
        if let listApps = response as? [AppModel], listApps.count > 0 {
            self.delegate?.reloadList!(appList: listApps.orderbyCategorys(apps: listApps))
        }
        
        if let currentUser =  response as? UserModel {
            self.delegate?.currentUser!(currentUser: currentUser)
        }
        
        if let count = response as? Int {
            count == 1 ? self.delegate?.installed!(result: true) : self.delegate?.installed!(result: false)
        }
    }
}


// MARK: Extensions
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
