//
//  AppTableViewCell.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/13/17.
//
//

import UIKit
import Spring
import Kingfisher

// MARK: CellsIdentifiers
let kIdentenfierTableViewCell = "AppTableViewCell"

class AppTableViewCell: UITableViewCell {

    @IBOutlet weak var appImageView: SpringImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func appCellData(appCell app: AppModel) {
        if let url = URL(string: app.image) {
            self.appImageView.kf.setImage(with: url)
        }
        self.firstLabel.text = app.artist
        self.secondLabel.text = app.name
        self.priceLabel.text = " $\(app.price)0 "
    }
    
}
