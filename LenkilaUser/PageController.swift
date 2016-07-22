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
    override func viewDidAppear(animated: Bool) {
        self.setLabelText()

        
    }
    func setLabelText(){
        label.text = "\(currentPageIndex)"
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCurrentPageIndex(newIndex:Int) {
        currentPageIndex = newIndex
        self.setLabelText()
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "containerViewSegue" {
            let pView = segue.destinationViewController as? PageViewController
            pView!.containerToMaster = self
            //pView!.setCurrentPageView(currentIndex)
        }
    }
    
   
}
