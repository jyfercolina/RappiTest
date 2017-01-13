//
//  RappiNavigationController.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/12/17.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
