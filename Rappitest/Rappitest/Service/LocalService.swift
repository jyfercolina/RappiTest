//
//  LocalService.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/13/17.
//
//

import Foundation
import RealmSwift

class LocalDataService {
    static let realm = try! Realm()
    
    static func saveData<T: Object>(_ data: T, success:@escaping (_ success: Bool) -> Void) {
        do {
            try realm.write {
                realm.add(data, update: true)
                success(true)
            }
        } catch _ as NSError {
            success(false)
        }
    }
    //"_id = %@"
    static func fetchData<T: Object>(_ type: T.Type, _ id: String = "", format: String) -> Results<T> {
        return id != "" ? realm.objects(type).filter(NSPredicate(format: format, id)) : realm.objects(type)
    }
    
    static func removeLocalData(){
        try! realm.write {
            realm.deleteAll()
        }
    }
}

