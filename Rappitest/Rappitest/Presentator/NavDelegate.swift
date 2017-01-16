//
//  NavDelegate.swift
//  Rappitest
//
//  Created by Momentum Lab 7 on 1/16/17.
//
//

import Foundation
import UIKit


class NavDelegate: NSObject, UINavigationControllerDelegate {
    private let animator = Animator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
}

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    private var selectedCellFrame: CGRect? = nil
    private var originalTableViewY: CGFloat? = nil
    private let defaults = UserDefaults.init()
    
    private func move(fromController from : UIViewController, toController to: UIViewController, withContext context: UIViewControllerContextTransitioning) {
        
        context.containerView.addSubview(to.view)
        to.view.alpha = 0.0
        
        UIView.animate(withDuration: 1.0, animations: {
            from.view.alpha = 0.0
            from.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            to.view.alpha = 1.0
        }) { finished in context.completeTransition(!context.transitionWasCancelled)}
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?)-> TimeInterval {
        return 1
    }
    
    func animateTransition(using context: UIViewControllerContextTransitioning) {
        if let fromViewController = context.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toViewController = context.viewController(forKey: UITransitionContextViewControllerKey.to){
            move(fromController: fromViewController, toController: toViewController, withContext: context)
        }
    }
}
