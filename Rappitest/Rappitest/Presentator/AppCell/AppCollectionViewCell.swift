//
//  AppCollectionViewCell.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/13/17.
//
//

import UIKit
import Spring

// MARK: CellsIdentifiers
let kIdentifierCollectionViewCell = "AppCollectionViewCell"

class AppCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var appImageView: SpringImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func appCellData(appCell app: AppModel) {
        if let url = URL(string: app.image) {
            self.appImageView.kf.setImage(with: url)
        }
        self.artistLabel.text = app.artist
        self.nameLabel.text = app.name
        self.priceLabel.text = "$\(app.price)0 "
    }
}
