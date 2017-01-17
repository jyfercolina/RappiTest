//
//  DataManager.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/13/17.
//
//

import Foundation
import UIKit

protocol DataManagerDelegate: class {
    func responseDataManager <T>(_ response: T)
}

class DataManager {
    
    var delegate : DataManagerDelegate?
    
    // MARK: Apps itunes list.
    func fetchApps() {
        if NetworkDataServices.isConnectedToNetwork() {
            self.fetchNetworkApps()
        } else {
            UIViewController.connectionOutside()
            self.fetchLocalApps()
        }
    }
    
    func fetchLocalApps() {
        let events = LocalDataService.fetchData(AppModel.self)
        self.delegate?.responseDataManager(events.toArray(ofType: AppModel.self))
    }
    
    func fetchNetworkApps() {
        NetworkDataServices.fetchArrayData(url: "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json", type: AppModel.self,
        success: {(result) in
            self.updateLocalData(listApp: result)
        }, fail: { (error) in
            self.fetchLocalApps()
        })
    }
    
    func updateLocalData(listApp apps: [AppModel]) {
        LocalDataService.saveData(apps, success: {(save) in
            if save {
                self.fetchLocalApps()
            }
        })
    }
    
    // MARK: Local user data.
    func fetchUserData() {
        let currentUser = LocalDataService.fetchData(UserModel.self).first
        self.delegate?.responseDataManager(currentUser)
    }
    
    static func newUserDefault() {
        // If no exist userDefault.
        if LocalDataService.fetchData(UserModel.self).count == 0 {
            LocalDataService.saveData(UserModel(JSON: ["email": "rappi@rappimail.com", "name": "Tester Rappi"]), success: {(success) in })
        }
    }
    
    func saveAppInstall(app: AppModel) {
        LocalDataService.saveData(app, success: {(success) in})
    }
    
    func filterApp(app: AppModel) {
        if let user = LocalDataService.fetchData(UserModel.self).first {
            let apps = user.apps.filter("id = %@", app.id)
            apps.isEmpty ? self.delegate?.responseDataManager(0) : self.delegate?.responseDataManager(1)
        }
    }

}
