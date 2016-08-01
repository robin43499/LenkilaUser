//
//  HomeViewController.swift
//  LenkilaUser
//
//  Created by Tanakorn on 7/28/2559 BE.
//  Copyright © 2559 Peeranut Mahatham. All rights reserved.
//

import UIKit
import LTMorphingLabel
import Spring
class HomeViewController: UIViewController,LTMorphingLabelDelegate {
    
    @IBOutlet weak var place_in_event: UILabel!
    @IBOutlet weak var date_in_event: UILabel!
    @IBOutlet weak var title_in_event: UILabel!
    @IBOutlet weak var view_in_event: UIView!
    @IBOutlet weak var img_cover: SpringImageView!
    @IBOutlet weak var img_lenkila: SpringImageView!
    @IBOutlet weak var sub_title: LTMorphingLabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sub_title.delegate = self
        sub_title.morphingEffect = .Scale
        self.sub_title.text = "Play sports"
        self.delay(3){
            self.sub_title.text = "dare to conquer the world"
        }
        self.delay(6){
            self.sub_title.font = UIFont(name: "HelveticaNeue-CondensedBold",size: 45)
            self.sub_title.textColor = UIColor.blackColor()
            self.sub_title.text = "Lenkila"
            
        }
        self.delay(9){
            self.sub_title.hidden = true
            self.img_lenkila.hidden = false
            self.img_lenkila.animate()
            self.img_lenkila.animateToNext({
                self.img_cover.hidden = false
                self.img_cover.animate()
            })
        }
        self.delay(13.8){
            self.view_in_event.hidden = false
            self.title_in_event.hidden = false
            self.date_in_event.hidden = false
            self.place_in_event.hidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
