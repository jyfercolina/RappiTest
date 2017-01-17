//
//  SectionTableViewController.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/14/17.
//
//

import UIKit
import Spring
import Kingfisher

// MARK: ClassIdentifiers
let kIdentifierSectionTable = "SectionTableViewController"

class SectionTableViewController: UIViewController {

    @IBOutlet weak var sectionTableView: UITableView!
   
    @IBOutlet weak var appImageView: SpringImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var detailButton: SpringButton!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var iTunesImage: UIImageView!
    @IBOutlet weak var freeLabel: UILabel!
    @IBOutlet weak var dowloadButton: SpringButton!
    
    var appList: [AppModel]?
    let interactor = Interactor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(appList!.first!.category)"
        // Register cell classes
        self.sectionTableView.register(UINib(nibName: kIdentenfierTableViewCell, bundle: nil), forCellReuseIdentifier: kIdentenfierTableViewCell)
        
        self.interactor.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.animateTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func detailButtonTapped(_ sender: UIButton) {
        self.routeDetailView(appDetail: (self.appList?[(self.sectionTableView.indexPathForSelectedRow?.row)!])!)
    }
    @IBAction func dowloadButtonTapped(_ sender: SpringButton) {
        if let index = self.sectionTableView.indexPathsForSelectedRows?.first, let appList = self.appList {
            self.interactor.installApp(app: appList[index.row])
            self.dowloadButton.isHidden = true
        }
    }
    
    func animateTable() {
        sectionTableView.reloadData()
        
        let cells = sectionTableView.visibleCells
        let tableHeight: CGFloat = sectionTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.transitionCurlDown, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }
    
    func animate() {
        self.iTunesImage.alpha = 0.5
        self.nameLabel.isHidden = false
        self.artistLabel.isHidden = false
        self.appImageView.animation = "slideUp"
        self.appImageView.duration = 3.0
        self.detailButton.animation = "zoomIn"
        self.detailButton.duration = 2.0
        self.detailButton.animate()
        self.detailButton.isHidden = false
        self.freeLabel.isHidden = false
        self.appImageView.animate()
        self.appImageView.isHidden = false
    }
}

// MARK: - Table view data source
extension SectionTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.appList != nil ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.appList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdentenfierTableViewCell) as! AppTableViewCell
        cell.appCellData(appCell: self.appList![indexPath.row])
        return cell
    }
}

// MARK: - TableViewDelegate
extension SectionTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let app = self.appList?[indexPath.row] {
            self.appImageView.kf.setImage(with: URL(string: app.image)!)
            self.nameLabel.text = app.name
            self.artistLabel.text = app.artist
            self.animate()
            self.interactor.installedApp(app: app)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
}

// MARK: InteractorDelegate
extension SectionTableViewController: InteractorDelegate {
    func installed(result: Bool) {
        self.dowloadButton.isHidden = result
    }
}
