//
//  PageContainerViewController.swift
//  LenkilaUser
//
//  Created by Peeranut Mahatham on 7/21/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit
import Foundation

class PageContainerViewController: UIViewController {

    @IBOutlet  var pageControl: UIPageControl!
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad();
       
    }
    
    //MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let pageViewController = segue.destinationViewController as? PageViewController {
            pageViewController.tutorialDelegate = self
        }
        
    }
    
    
}

extension PageContainerViewController: PageViewControllerDelegate {
    
    func pageViewController(pageViewController: PageViewController,didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func pageViewController(pageViewController: PageViewController,didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}

class PageControl: UIPageControl {
    var activeImage: UIImage!
    var inactiveImage: UIImage!
    override var currentPage: Int {
        //willSet {
        didSet { //so updates will take place after page changed
            self.updateDots()
        }
    }
    
    convenience init(activeImage: UIImage, inactiveImage: UIImage) {
        self.init()
        
        self.activeImage = activeImage
        self.inactiveImage = inactiveImage
        
        self.pageIndicatorTintColor = UIColor.clearColor()
        self.currentPageIndicatorTintColor = UIColor.clearColor()
    }
    
    func updateDots() {
        for i in 0..<subviews.count {
            var view: UIView = subviews[i] as! UIView
            if view.subviews.count == 0 {
                self.addImageViewOnDotView(view, imageSize: activeImage.size)
            }
            var imageView: UIImageView = view.subviews.first as! UIImageView
            imageView.image = self.currentPage == i ? activeImage : inactiveImage
        }
    }
    
    // MARK: - Private
    
    func addImageViewOnDotView(view: UIView, imageSize: CGSize) {
        var frame = view.frame
        frame.origin = CGPointZero
        frame.size = imageSize
        
        var imageView = UIImageView(frame: frame)
        imageView.contentMode = UIViewContentMode.Center
        view.addSubview(imageView)
    }

}
