//
//  PKNetworkActivityController.swift
//  PKNetworkActivityController
//
//  Created by Philip Kluz on 6/19/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import Foundation

class PKNetworkActivityController: NSObject {
    
    class var sharedController: PKNetworkActivityController {
        return Constants.sharedController
    }
    
    /// The number of activities in progress. Iff the number is greater than 0, the network activity indicator is visible (unless modified by an external source).
    var numberOfRegisteredActivities: Int = 0
    
    /// Registers for network activity.
    func registerActivity() {
        withUnsafePointer(&spinLock, OSSpinLockLock)
        
        numberOfRegisteredActivities += 1
        if numberOfRegisteredActivities > 0 {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        }
        
        withUnsafePointer(&spinLock, OSSpinLockUnlock)
    }
    
    /// Deregisters from network activity.
    func deregisterActivity() {
        withUnsafePointer(&spinLock, OSSpinLockLock)
        
        let newValue = numberOfRegisteredActivities - 1
        numberOfRegisteredActivities = newValue >= 0 ? newValue : 0
        if numberOfRegisteredActivities == 0 {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        
        withUnsafePointer(&spinLock, OSSpinLockUnlock)
    }
    
    // #MARK: Private
    
    struct Constants {
        static let sharedController = PKNetworkActivityController.init()
    }
    
    var spinLock = OS_SPINLOCK_INIT
}
