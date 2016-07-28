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
import Realm
class LoginViewController: UIViewController,FBSDKLoginButtonDelegate {

    @IBOutlet weak var img_bg: UIImageView!
    @IBOutlet weak var btn_facebook: FBSDKLoginButton!
    @IBAction func btn_google_login(sender: UIButton) {
        
    }
    @IBAction func btn_facebook_login(sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_facebook.readPermissions = ["public_profile", "email", "user_friends","user_birthday"]
        btn_facebook.delegate = self
        let u = User.allObjects()
        if u.count > 0 {
            let user = u[0] as! User
            if user.already_login{
                self.view.bringSubviewToFront(img_bg)
            }
        }
                // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let u = User.allObjects()
        if u.count > 0 {
            let user = u[0] as! User
            if user.already_login{
                self.performSegueWithIdentifier("go_login", sender: self)
            }
        }
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
            returnUserData()
        }
    }
    
    func returnUserData()
    {
        
        print("hello")
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
                let name : NSString = result.valueForKey("name") as! String
                let birthday : NSString = result.valueForKey("birthday") as! String
                var u = User.allObjects()
                if u.count == 0 {
                let realm = RLMRealm.defaultRealm()
                realm.beginWriteTransaction()
                let user = User()
                user.id = String(id)
                user.name = String(name)
                user.birthday = String(birthday)
                realm.addObject(user)
                try! realm.commitWriteTransaction()
                }else{
                    let realm = RLMRealm.defaultRealm()
                    realm.beginWriteTransaction()
                    var user = User()
                    let u = User.allObjects()
                    user = u[0] as! User
                    user.id = String(id)
                    user.name = String(name)
                    user.birthday = String(birthday)
                    try! realm.commitWriteTransaction()
                }
                let realm = RLMRealm.defaultRealm()
                realm.beginWriteTransaction()
                var user = User()
                u = User.allObjects()
                user = u[0] as! User
                user.already_login = true
                try! realm.commitWriteTransaction()
                self.performSegueWithIdentifier("go_login", sender: self)
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
