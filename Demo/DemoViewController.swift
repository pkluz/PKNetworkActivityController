//
//  DemoViewController.swift
//  Demo
//
//  Created by Philip Kluz on 6/19/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit
import PKNetworkActivityController

class DemoViewController: UIViewController {
    
    @IBOutlet var activityCountLabel: UILabel!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(DemoViewController.updateUserInterface), userInfo: nil, repeats: true)
    }
    
    func updateUserInterface() {
        let countString = String(NetworkActivityController.sharedController.numberOfRegisteredActivities)
        activityCountLabel.text = countString
    }
    
    @IBAction func registerNetworkActivity(_ sender: AnyObject) {
        NetworkActivityController.sharedController.registerActivity()
    }
    
    @IBAction func deregisterNetworkActivity(_ sender: AnyObject) {
        NetworkActivityController.sharedController.deregisterActivity()
    }
    
    @IBAction func asyncRegisterNetworkActivity(_ sender: AnyObject) {
        DispatchQueue.global().async {
            NetworkActivityController.sharedController.registerActivity()
        }
    }
    
    @IBAction func asyncDeregisterNetworkActivity(_ sender: AnyObject) {
        DispatchQueue.global().async {
            NetworkActivityController.sharedController.deregisterActivity()
        }
    }
}
