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
    
    @IBOutlet var activityCountLabel: UILabel
    var timer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateUserInterface"), userInfo: nil, repeats: true)
    }
    
    func updateUserInterface() {
        var countString = String(PKNetworkActivityController.sharedController.numberOfRegisteredActivities)
        activityCountLabel.text = countString
    }
    
    @IBAction func registerNetworkActivity(sender: AnyObject) {
        PKNetworkActivityController.sharedController.registerActivity()
    }
    
    @IBAction func deregisterNetworkActivity(sender: AnyObject) {
        PKNetworkActivityController.sharedController.deregisterActivity()
    }
    
    @IBAction func asyncRegisterNetworkActivity(sender: AnyObject) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            PKNetworkActivityController.sharedController.registerActivity()
        }
    }
    
    @IBAction func asyncDeregisterNetworkActivity(sender: AnyObject) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            PKNetworkActivityController.sharedController.deregisterActivity()
        }
    }
}

