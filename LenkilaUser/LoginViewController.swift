//
//  LoginViewController.swift
//  LenkilaUser
//
//  Created by Tanakorn on 7/27/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
class LoginViewController: UIViewController,FBSDKLoginButtonDelegate {

    @IBOutlet weak var img_bg: UIImageView!
    @IBOutlet weak var btn_facebook: FBSDKLoginButton!
    @IBAction func btn_google_login(sender: UIButton) {
        
    }
    @IBAction func btn_facebook_login(sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_facebook.readPermissions = ["public_profile","user_friends"]
        btn_facebook.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        self.view.bringSubviewToFront(img_bg)
        if ((error) != nil)
        {
            //handle error
        } else {
            self.performSegueWithIdentifier("go_login", sender: self)
            returnUserData()
            
        }
    }
    
    func returnUserData()
    {
        
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,interested_in,gender,birthday,email,age_range,name,picture.width(480).height(480)"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let id : NSString = result.valueForKey("id") as! String
                print("User ID is: \(id)")
                //etc...
            }
        })
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
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
