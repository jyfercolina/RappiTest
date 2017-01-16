//
//  DataManager.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/13/17.
//
//

import Foundation

protocol DataManagerDelegate: class {
    func responseDataManager <T>(_ response: T)
}

class DataManager {
    
    var delegate : DataManagerDelegate?
    
    func fetchApps() {
        fetchNetworkApps()
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

}
