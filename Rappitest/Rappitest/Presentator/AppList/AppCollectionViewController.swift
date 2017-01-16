//
//  RappiCollectionViewController.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/12/17.
//
//

import UIKit

private let reuseIdentifier = "Cell"

class AppCollectionViewController: UICollectionViewController {

    var categorys : [String : [AppModel]] = [:]
    let interator = Interactor()
    var itemsPerRow: CGFloat = 4
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 30.0, right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Top Free Applications"
        self.interator.delegate = self
        self.interator.retrieveData()

        self.clearsSelectionOnViewWillAppear = true
        // Register cell classes
        self.collectionView!.register(UINib(nibName: kIdentifierCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: kIdentifierCollectionViewCell)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.categorys.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if categorys.count > 0 {
            let key = Array(self.categorys.keys)[section]
            let array = categorys[key]
            return array!.count
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kIdentifierCollectionViewCell, for: indexPath) as! AppCollectionViewCell
        if categorys.count > 0 {
            let key = Array(self.categorys.keys)[indexPath.section]
            let array = categorys[key]
            cell.appCellData(appCell: array![indexPath.row])
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let key = Array(self.categorys.keys)[indexPath.section]
        let array = categorys[key]
        self.routeSectionView(appListSection: array!)
    }

}

extension AppCollectionViewController : UICollectionViewDelegateFlowLayout {
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

extension AppCollectionViewController: InteractorDelegate {
    func reloadList(appList apps: [String : [AppModel]]) {
        self.categorys = apps
        self.collectionView!.reloadData()
    }
}
