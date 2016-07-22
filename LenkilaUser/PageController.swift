//
//  PageController.swift
//  LenkilaUser
//
//  Created by Peeranut Mahatham on 7/21/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit

protocol MasterToContainer {
    func tapSegmentButtonAction(num: Int)
}

class PageController: UIViewController,ContainerToMaster {

    @IBOutlet var PageView: UIView!
    var masterToContainer:MasterToContainer?
    var currentPageIndex: Int = 0
    
    //img icon
    @IBOutlet var img1: UIButton!
    @IBOutlet var img2: UIButton!
    @IBOutlet var img3: UIButton!
    
    @IBOutlet var navView: UIView!
    
    
    
    
    
    
    @IBOutlet var label: UILabel!
    
    @IBAction func findPitchButton(sender: AnyObject) {
//        currentIndex = 2
//        masterToContainer?.setCurrentPageView(2)
//        label.text = "\(currentIndex)"
//        //PageViewController().setCurrentPageView(2)
        
            PageViewController().tapSegmentButtonAction(2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.setLabelText()

        
    }
    override func viewWillAppear(animated: Bool) {
        self.setLabelText()
        self.setupSelector()
    }
    func setLabelText(){
        label.text = "\(currentPageIndex)"
        
    }
    
    func setupSelector() {
        let selectionBar = UIView(frame: CGRectMake(img1.frame.origin.x+100, img1.frame.origin.y,img1.frame.size.width/3, 4))
        selectionBar.backgroundColor = UIColor.greenColor() //%%% sbcolor
        selectionBar.alpha = 0.8; //%%% sbalpha
        navView.addSubview(selectionBar)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCurrentPageIndex(newIndex:Int) {
        currentPageIndex = newIndex
        self.setLabelText()
    }
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        let xFromCenter:CGFloat = self.view.frame.size.width - pageScrollView.contentOffset.x //%%% positive for right swipe, negative for left
//        
//        //%%% checks to see what page you are on and adjusts the xCoor accordingly.
//        //i.e. if you're on the second page, it makes sure that the bar starts from the frame.origin.x of the
//        //second tab instead of the beginning
//        let xCoor:CGFloat = X_BUFFER + selectionBar.frame.size.width * CGFloat(currentPageIndex) - X_OFFSET;
//        
//        selectionBar.frame = CGRectMake(xCoor-xFromCenter/CGFloat(3), selectionBar.frame.origin.y, selectionBar.frame.size.width, 4);
//    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "containerViewSegue" {
            let pView = segue.destinationViewController as? PageViewController
            pView!.containerToMaster = self
            

        }
    }
    
   
}
