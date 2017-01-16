//
//  Page3ViewController.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/14/17.
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
        self.goLabel.duration = 4.0
        self.goLabel.animate()
        self.signInButton.animation = "wobble"
        self.signInButton.duration = 4.0
        self.signInButton.animate()
    }
    
    @IBAction func siginButtonTapped(_ sender: UIButton) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
