//
//  HeaderCollectionViewCell.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/17/17.
//
//

import UIKit

// MARK: HeaderIdentifiers
let kIdentifierHeaderCollectionView = "HeaderCollectionViewCell"

class HeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func titleHeader(title: String) {
        self.title.text = "\(title.capitalized)"
    }

}
