//
//  MainViewController.swift
//  LenkilaUser
//
//  Created by Peeranut Mahatham on 7/22/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit
import SwipeViewController

class MainViewController: SwipeViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //set up page array
        let page_one = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("News") as UIViewController
        let page_two = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Chat") as UIViewController
        let page_three = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FindPitch") as UIViewController
        setViewControllerArray([page_one, page_two, page_three])
        setFirstViewController(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
