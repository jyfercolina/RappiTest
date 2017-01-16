//
//  HeaderTableViewCell.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/14/17.
//
//

import UIKit

let kIdentifierHeaderTableView = "HeaderTableViewCell"

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func titleHeader(title: String) {
        self.title.text = title.capitalized
    }
    
}
