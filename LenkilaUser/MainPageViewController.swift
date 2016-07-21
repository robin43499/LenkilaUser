//
//  MainPageViewController.swift
//  LenkilaUser
//
//  Created by Peeranut Mahatham on 7/20/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController,UIPageViewControllerDataSource {
    
    
    
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.listViewController("News"),
                self.listViewController("Chat"),
                self.listViewController("FindPitch")]
    }()
    
    weak var tutorialDelegate: PageViewControllerDelegate?
    
    private func listViewController(list: String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("\(list)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        delegate = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],direction: .Forward,animated: true,completion: nil)
        }
        
        tutorialDelegate?.pageViewController(self,didUpdatePageCount: orderedViewControllers.count)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController,viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }

}
extension MainPageViewController: UIPageViewControllerDelegate {
    
    
    
    func pageViewController(pageViewController: UIPageViewController,didFinishAnimating finished: Bool,previousViewControllers: [UIViewController],transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.indexOf(firstViewController) {
            tutorialDelegate?.pageViewController(self,didUpdatePageIndex: index)
        }
    }
    
    
}

protocol PageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter count: the total number of pages.
     */
    func pageViewController(pageViewController: MainPageViewController,didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func pageViewController(pageViewController: MainPageViewController,didUpdatePageIndex index: Int)
    
}