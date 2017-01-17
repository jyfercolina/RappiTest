//
//  RappiNavigationController.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/12/17.
//
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch UIDevice.current.model {
        case "iPad":
            let collectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "AppCollectionViewController")
            self.pushViewController(collectionViewController!, animated: true)
        default:
            let tableViewController = self.storyboard?.instantiateViewController(withIdentifier: "AppTableViewController")
            self.pushViewController(tableViewController!, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}




