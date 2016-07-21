//
//  HeaderPageViewController.swift
//  LenkilaUser
//
//  Created by Peeranut Mahatham on 7/20/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit

class HeaderPageViewController: UIViewController {

    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let pageViewController = segue.destinationViewController as? MainPageViewController {
            pageViewController.tutorialDelegate = self
        }
        
    }

}

extension MainPageViewController: PageViewControllerDelegate {
    
    func pageViewController(pageViewController: MainPageViewController,didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func pageViewController(pageViewController: MainPageViewController,didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}

