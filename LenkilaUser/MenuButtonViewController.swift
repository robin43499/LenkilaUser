//
//  MenuButtonViewController.swift
//  LenkilaUser
//
//  Created by Peeranut Mahatham on 7/23/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit
import SideMenu

class MenuButtonViewController: UIViewController {
    private var selectedIndex = 0
    private var transitionPoint: CGPoint!
    //private var contentType: ContentType = .Music
    private var navigator: UINavigationController!
    lazy private var menuAnimator : MenuTransitionAnimator! = MenuTransitionAnimator(mode: .Presentation, shouldPassEventsOutsideMenu: false) { [unowned self] in
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch (segue.identifier, segue.destinationViewController) {
        case (.Some("presentMenu"), let menu as MenuViewController):
            menu.selectedItem = selectedIndex
            menu.delegate = self
            menu.transitioningDelegate = self
            menu.modalPresentationStyle = .Custom
        case (.Some("embedNavigator"), let navigator as UINavigationController):
            self.navigator = navigator
            self.navigator.delegate = self
        default:
            super.prepareForSegue(segue, sender: sender)
        }
    }
}

extension MenuButtonViewController: MenuViewControllerDelegate {
    func menu(_: MenuViewController, didSelectItemAtIndex index: Int, atPoint point: CGPoint) {
        //contentType = !contentType
        transitionPoint = point
        selectedIndex = index
        let vc = ["swipe","blue","green"]
        let content = storyboard!.instantiateViewControllerWithIdentifier(vc[selectedIndex])
        self.navigator.setViewControllers([content], animated: true)
        dispatch_async(dispatch_get_main_queue()) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func menuDidCancel(_: MenuViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension MenuButtonViewController: UINavigationControllerDelegate {
    func navigationController(_: UINavigationController, animationControllerForOperation _: UINavigationControllerOperation,
                              fromViewController _: UIViewController, toViewController _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if let transitionPoint = transitionPoint {
            return CircularRevealTransitionAnimator(center: transitionPoint)
        }
        return nil
    }
}

extension MenuButtonViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController _: UIViewController,
                                                   sourceController _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return menuAnimator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MenuTransitionAnimator(mode: .Dismissal)
    }
    
}
