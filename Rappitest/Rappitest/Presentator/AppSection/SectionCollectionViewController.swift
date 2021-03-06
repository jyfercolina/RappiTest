//
//  SectionCollectionViewController.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/14/17.
//
//

import UIKit
import Spring

// MARK: ClassIdentifiers
let kIdentifierSectionCollection = "SectionCollectionViewController"

class SectionCollectionViewController: UIViewController {
    
    @IBOutlet weak var sectionCollectionView: UICollectionView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var appimageView: SpringImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var detailButton: SpringButton!
    @IBOutlet weak var iTunesImage: SpringImageView!
    @IBOutlet weak var freeLabel: UILabel!
    @IBOutlet weak var installAppButton: SpringButton!
    
    var appList: [AppModel]?
    let interactor = Interactor()
    
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 30.0, right: 10.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Top Free Application - \(appList!.first!.category)"
        // Register cell classes
        self.sectionCollectionView.register(UINib(nibName: kIdentifierCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: kIdentifierCollectionViewCell)
        
        self.interactor.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func detailButtonTapped(_ sender: SpringButton) {
        if let index = self.sectionCollectionView.indexPathsForSelectedItems?.first, let appList = self.appList {
            self.routeDetailView(appDetail: appList[index.row])
        }
    }
    
    @IBAction func installAppButtonTapped(_ sender: SpringButton) {
        if let index = self.sectionCollectionView.indexPathsForSelectedItems?.first, let appList = self.appList {
            self.interactor.installApp(app: appList[index.row])
            self.installAppButton.isHidden = true
        }
    }
}

// MARK: UICollectionViewDataSource
extension SectionCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.appList != nil ? 1 : 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.appList?.count ?? 0
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kIdentifierCollectionViewCell, for: indexPath) as! AppCollectionViewCell
        cell.appCellData(appCell: self.appList![indexPath.row])
        return cell
    }
    
    func animate() {
        self.iTunesImage.alpha = 0.5
        self.nameLabel.isHidden = false
        self.artistLabel.isHidden = false
        self.appimageView.animation = "slideUp"
        self.appimageView.duration = 3.0
        self.detailButton.animation = "zoomIn"
        self.detailButton.duration = 2.0
        self.detailButton.animate()
        self.detailButton.isHidden = false
        self.freeLabel.isHidden = false
        self.appimageView.animate()
        self.appimageView.isHidden = false
    }
}

// MARK: UICollectionViewDelegate
extension SectionCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = self.appList?[indexPath.row] {
            self.appimageView.kf.setImage(with: URL(string: app.image)!)
            self.nameLabel.text = app.name
            self.artistLabel.text = app.artist
            self.animate()
            self.interactor.installedApp(app: app)
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension SectionCollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

// MARK: InteractorDelegate
extension SectionCollectionViewController: InteractorDelegate {
    func installed(result: Bool) {
        self.installAppButton.isHidden = result
    }
}
