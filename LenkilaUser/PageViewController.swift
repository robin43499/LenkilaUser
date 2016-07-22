//
//  PageViewController.swift
//  LenkilaUser
//
//  Created by Peeranut Mahatham on 7/21/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit

protocol ContainerToMaster {
    func updateCurrentPageIndex(newIndex:Int)
}

class PageViewController: UIPageViewController, UIPageViewControllerDelegate,UIPageViewControllerDataSource, MasterToContainer {
    
    
    
    
    
    
    var containerToMaster:ContainerToMaster?
    
    //set up page array
    var viewControllerArray = [UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("News") as UIViewController,
                               UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Chat") as UIViewController,
                               UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FindPitch") as UIViewController]
    
    var currentPageIndex: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.alpha = 0.0
        UIView.animateWithDuration(1.5, animations: {
            self.view.alpha = 1.0
        })
    }
    override func viewWillAppear(animated: Bool) {
        self.setupPageViewController()
    }
    
    //%%% generic setup stuff for a pageview controller.  Sets up the scrolling style and delegate for the controller
    func setupPageViewController() {
        self.delegate = self
        self.dataSource = self
        self.setViewControllers([viewControllerArray[0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }
    
    func updateCurrentPageIndex(newIndex:Int) {
        currentPageIndex = newIndex
        containerToMaster?.updateCurrentPageIndex(newIndex)
    }
    
    func tapSegmentButtonAction(num: Int) {
        
        let tempIndex:Int = currentPageIndex
        weak var weakSelf = self
        //%%% check to see if you're going left -> right or right -> left
        if num > tempIndex {
            //%%% scroll through all the objects between the two points
            for var i = tempIndex+1 ; i <= num ; i++ {
                let index = i
                self.setViewControllers([viewControllerArray[i]], direction:UIPageViewControllerNavigationDirection.Forward, animated: true, completion: {complete in
                    
                    //%%% if the action finishes scrolling (i.e. the user doesn't stop it in the middle),
                    //then it updates the page that it's currently on
                    if complete {
                        weakSelf?.updateCurrentPageIndex(index)
                        print("1")
                    }
                    
                })
            }
        }
            //%%% this is the same thing but for going right -> left
        else if num < tempIndex {
            for var i = tempIndex-1 ; i >= num ; i-- {
                let index = i
                self.setViewControllers([viewControllerArray[i]], direction: UIPageViewControllerNavigationDirection.Reverse, animated: true, completion: {complete in
                    if complete {
                        weakSelf?.updateCurrentPageIndex(index)
                    }
                })
            }
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pageViewController(pageViewController: UIPageViewController,viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index :Int = self.indexOfController(viewController);
        if (index == NSNotFound) {
            return nil
        }
        index--
        if (0 <= index && index < viewControllerArray.count) {
            return viewControllerArray[index]
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController,viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index :Int = self.indexOfController(viewController)
        if (index == NSNotFound) {
            return nil
        }
        index++
        if (0 <= index && index < viewControllerArray.count) {
            return viewControllerArray[index]
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if (completed) {
            //currentPageIndex = self.indexOfController(pageViewController.viewControllers!.last! as UIViewController)
            updateCurrentPageIndex(self.indexOfController(pageViewController.viewControllers!.last! as UIViewController))
        }
    }

    
    func indexOfController(viewController :UIViewController) -> Int {
        for (var i = 0 ; i < viewControllerArray.count ; i++) {
            if (viewController == viewControllerArray[i]) {
                return i
            }
        }
        return NSNotFound
    }
    
    

    

    
}

