//
//  Page3ViewController.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/14/17.
//
//

import UIKit
import Spring

class Page3ViewController: UIViewController {

    
    @IBOutlet weak var signInButton: SpringButton!
    @IBOutlet weak var iconImage: SpringImageView!
    @IBOutlet weak var goLabel: SpringLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.signInButton.isHidden = true
        self.animation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animation() {
        self.iconImage.animation = "fadeIn"
        self.iconImage.duration = 5.0
        self.iconImage.animate()
        self.goLabel.animation = "zoomOut"
        self.goLabel.duration = 3.0
        self.goLabel.animate()
        self.goLabel.animateNext {
            self.signInButton.isHidden = false
            self.signInButton.animation = "morph"
            self.signInButton.duration = 1.0
            self.signInButton.repeatCount = 10
            self.signInButton.animate()
        }
    }
    
    @IBAction func siginButtonTapped(_ sender: UIButton) {
    }

}
