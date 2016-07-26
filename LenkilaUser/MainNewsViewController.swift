//
//  MainNewsViewController.swift
//  LenkilaUser
//
//  Created by Tanakorn on 7/26/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit

class MainNewsViewController: UIViewController {
    //Variable
    //Outlet
    @IBOutlet weak var img_thai_flag: UIImageView!
    //Button
    override func viewDidLoad() {
        super.viewDidLoad()
        img_thai_flag.layer.cornerRadius = 15
        img_thai_flag.layer.masksToBounds = true
        // Do any additional setup after loading the view.
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
