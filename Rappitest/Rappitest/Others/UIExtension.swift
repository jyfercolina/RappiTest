//
//  Extension.swift
//  Rappitest
//
//  Created by Jyferson Colina on 1/13/17.
//
//

import Foundation
import UIKit

// MARK: UIView
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func fadeIn(withDuration duration: TimeInterval = 1.0, tableView: NSLayoutConstraint?) {
        self.isHidden = false
        self.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 100.0
            tableView?.constant = 2
        })
    }
}

// MARK: UIViewController
extension UIViewController {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    static func connectionOutside(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) {
        let vc = self.topViewController(controller: controller)
        
        let alert = UIAlertController(title: "Rappi", message: "Sorry! Your Internet Connection Has Failed. Working Local Mode.", preferredStyle: .alert)
        
        let oKAction = UIAlertAction(title: "OK", style: .destructive) { (UIAlertAction) -> Void in
            
        }
        
        alert.addAction(oKAction)
        vc!.present(alert, animated: true, completion: nil)
    }

}
