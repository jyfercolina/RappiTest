//
//  Router.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/13/17.
//
//

import Foundation
import UIKit
import Spring

extension AppTableViewController {
    func routeSectionView(appListSection appList: [AppModel]) {
        let sectionView = self.storyboard?.instantiateViewController(withIdentifier: kIdentifierSectionTable) as! SectionTableViewController
        sectionView.appList = appList
        self.navigationController?.pushViewController(sectionView, animated: true)
    }
}

extension SectionTableViewController {
    func routeDetailView(appDetail app: AppModel) {
        let detailView = self.storyboard?.instantiateViewController(withIdentifier: kIdentifierDetailView) as! AppDetailViewController
        detailView.appDetail = app
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}

extension AppCollectionViewController {
    func routeSectionView(appListSection appList: [AppModel]) {
        let sectionView = self.storyboard?.instantiateViewController(withIdentifier: kIdentifierSectionCollection) as! SectionCollectionViewController
        sectionView.appList = appList
        self.navigationController?.pushViewController(sectionView, animated: false)
    }
}

extension SectionCollectionViewController {
    func routeDetailView(appDetail app: AppModel) {
        let storyboard = UIStoryboard(name: "ListApps", bundle: nil)
        let detailView = storyboard.instantiateViewController(withIdentifier: kIdentifierDetailView) as! AppDetailViewController
        detailView.appDetail = app
        self.navigationController?.pushViewController(detailView, animated: false)
    }
}
