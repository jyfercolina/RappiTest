//
//  AppDetailViewController.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/13/17.
//
//

import UIKit
import Spring
import Kingfisher

let kIdentifierDetailView = "AppDetailViewController"

class AppDetailViewController: UIViewController {

    @IBOutlet weak var appImageView: SpringImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var detailView: SpringView!
    
    var appDetail: AppModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.isScrollEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.detailApp()
        self.detailView.animation = "Slideup"
        self.detailView.duration = 3
        self.detailView.animate()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.textView.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.detailView.animation = "FadeInLeft"
        self.detailView.duration = 3
        self.detailView.animate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func detailApp() {
        if let app = self.appDetail {
            self.appImageView.kf.setImage(with: URL(string: app.image)!)
            self.nameLabel.text = app.name
            self.artistLabel.text = app.artist
            self.priceLabel.text = "$\(app.price)0"
            self.typeLabel.text = app.contentType
            self.rightLabel.text = app.rights
            self.categoryLabel.text = app.category
            self.idLabel.text = app.id
            self.dateLabel.text = app.releaseDate
            self.textView.text = app.summary
            self.textView.isScrollEnabled = true
        }
    }
}
