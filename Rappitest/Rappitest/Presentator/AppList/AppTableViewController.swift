//
//  RappiTableViewController.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/12/17.
//
//

import UIKit



class AppTableViewController: UITableViewController {

    var categorys : [String : [AppModel]] = [:]
    let interator = Interactor()
    
    
    
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeLeft
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIDevice.current.orientation.rawValue == UIInterfaceOrientation.portrait.rawValue{
            let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }
        self.navigationItem.title = "Top Free Applications"
        self.interator.delegate = self
        self.interator.retrieveData()
        
        // Register cell classes
        self.tableView.register(UINib(nibName: kIdentenfierTableViewCell, bundle: nil), forCellReuseIdentifier: kIdentenfierTableViewCell)
        self.tableView.register(UINib(nibName: kIdentifierHeaderTableView, bundle: nil), forCellReuseIdentifier: kIdentifierHeaderTableView)
        self.clearsSelectionOnViewWillAppear = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.categorys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categorys.count > 0 {
            let key = Array(self.categorys.keys)[section]
            let array = categorys[key]
            return array!.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdentenfierTableViewCell) as! AppTableViewCell
        let key = Array(self.categorys.keys)[indexPath.section]
        let category = categorys[key]
        cell.appCellData(appCell: category![indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: kIdentifierHeaderTableView) as! HeaderTableViewCell
        header.titleHeader(title: Array(self.categorys.keys)[section])
        return header
    }
    
    // MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = Array(self.categorys.keys)[indexPath.section]
        let category = categorys[key]
        self.routeSectionView(appListSection: category!)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }

}

// MARK: - InteratorDelegate
extension AppTableViewController: InteractorDelegate {
    func reloadList(appList apps: [String : [AppModel]]) {
        self.categorys = apps
        self.tableView.reloadData()
    }
}

