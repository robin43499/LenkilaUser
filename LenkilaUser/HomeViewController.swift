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
import AlertOnboarding
import ChameleonFramework
class HomeViewController: UIViewController,LTMorphingLabelDelegate,AlertOnboardingDelegate {
    //variable
    var alertView: AlertOnboarding!
    
    var arrayOfImage = ["image1", "image2", "image3"]
    var arrayOfTitle = ["CREATE ACCOUNT", "CHOOSE THE PLANET", "DEPARTURE"]
    var arrayOfDescription = ["In your profile, you can view the statistics of its operations and the recommandations of friends",
                              "Purchase tickets on hot tours to your favorite planet and fly to the most comfortable intergalactic spaceships of best companies",
                              "In the process of flight you will be in cryogenic sleep and supply the body with all the necessary things for life"]
    //Outlet
    @IBOutlet weak var btn_buy: UIButton!
    @IBOutlet weak var vw_level: UIView!
    @IBOutlet weak var btn_join_in_match: SpringButton!
    @IBOutlet weak var btn_join_in_event_description: SpringButton!
    @IBOutlet weak var btn_img_join_in_event: SpringImageView!
    var status_event : Bool = false
    @IBOutlet weak var event_description: SpringView!
    @IBOutlet weak var place_in_event: UILabel!
    @IBOutlet weak var date_in_event: UILabel!
    @IBOutlet weak var title_in_event: UILabel!
    @IBOutlet weak var view_in_event: UIView!
    @IBOutlet weak var img_cover: SpringImageView!
    @IBOutlet weak var btn_vote: UIButton!
    @IBOutlet weak var btn_review: UIButton!
    //action
    @IBOutlet weak var lb_lb_discount: UILabel!
    @IBAction func btn_join_in_event_action(sender: SpringButton) {
        btn_join_in_event_description.animation = "zoomIn"
        btn_join_in_event_description.animate()
        self.alertView.show()
            }
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_join_in_event_description.layer.cornerRadius = 20
        btn_join_in_event_description.layer.masksToBounds = true
        vw_level.layer.cornerRadius = 18
        vw_level.layer.masksToBounds = true
        btn_join_in_match.layer.cornerRadius = 20
        btn_join_in_match.layer.masksToBounds = true
        btn_buy.layer.cornerRadius = 18
        btn_buy.layer.masksToBounds = true
        lb_lb_discount.layer.cornerRadius = 18
        lb_lb_discount.layer.masksToBounds = true
        btn_vote.layer.cornerRadius = 5
        btn_vote.layer.masksToBounds = true
        btn_review.layer.cornerRadius = 15
        btn_review.layer.masksToBounds = true
                self.img_cover.hidden = false
                self.img_cover.animate()
                self.event_description.hidden = false
                self.event_description.animate()
        self.delay(0.8){
            self.view_in_event.hidden = false
            self.title_in_event.hidden = false
            self.date_in_event.hidden = false
            self.place_in_event.hidden = false
        }
        alertView = AlertOnboarding(arrayOfImage: arrayOfImage, arrayOfTitle: arrayOfTitle, arrayOfDescription: arrayOfDescription)
        alertView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    //Delegate Method
    func alertOnboardingSkipped(currentStep: Int, maxStep: Int) {
        print("Onboarding skipped the \(currentStep) step and the max step he saw was the number \(maxStep)")
    }
    
    func alertOnboardingCompleted() {
        print("Onboarding completed!")
    }
    
    func alertOnboardingNext(nextStep: Int) {
        print("Next step triggered! \(nextStep)")
    }
}
