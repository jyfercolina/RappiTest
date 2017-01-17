//
//  SignOutViewController.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/16/17.
//
//

import UIKit
import Spring
import RealmSwift

// MARK: ClassIdentifiers
let kIdentifierSignOutViewController = "SignOutViewController"

class SignOutViewController: UIViewController {

    @IBOutlet weak var profileImageView: SpringImageView!
    @IBOutlet weak var countApps: UILabel!
    @IBOutlet weak var countUpdates: UILabel!
    @IBOutlet weak var appsCollectionView: UICollectionView!
    
    var appList: List<AppModel>?
    
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    let interactor = Interactor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appsCollectionView.register(UINib(nibName: kIdentifierCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: kIdentifierCollectionViewCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.interactor.delegate = self
        self.interactor.retrieveCurrentUser()
        self.animate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RappiPageViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
}

// MARK: UICollectionViewDataSource
extension SignOutViewController: UICollectionViewDataSource {
    
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
        self.profileImageView.animation = "zoomIn"
        self.profileImageView.duration = 2.5
        self.profileImageView.animate()
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension SignOutViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

// MARK: InteractorDelegate
extension SignOutViewController : InteractorDelegate {
    func currentUser(currentUser user: UserModel) {
        self.appList = user.apps
        self.countApps.text = "\(user.apps.count)"
    }
}

