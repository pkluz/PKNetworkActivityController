//
//  PKNetworkActivityController.swift
//  PKNetworkActivityController
//
//  Created by Philip Kluz on 6/19/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

@objc (PKNetworkActivityController) public class NetworkActivityController {
    
    public class var sharedController: NetworkActivityController {
        return Constants.sharedController
    }
    
    /// The number of activities in progress. Iff the number is greater than 0, the network activity indicator is visible (unless modified by an external source).
    public var numberOfRegisteredActivities: Int = 0
    
    /// Registers for network activity.
    public func registerActivity() {
        withUnsafeMutablePointer(&spinLock, OSSpinLockLock)
        
        numberOfRegisteredActivities += 1
        if numberOfRegisteredActivities > 0 {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        }
        
        withUnsafeMutablePointer(&spinLock, OSSpinLockUnlock)
    }
    
    /// Deregisters from network activity.
    public func deregisterActivity() {
        withUnsafeMutablePointer(&spinLock, OSSpinLockLock)
        
        let newValue = numberOfRegisteredActivities - 1
        numberOfRegisteredActivities = newValue >= 0 ? newValue : 0
        if numberOfRegisteredActivities == 0 {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        
        withUnsafeMutablePointer(&spinLock, OSSpinLockUnlock)
    }
    
    // #MARK: Private
    
    private struct Constants {
        static let sharedController = NetworkActivityController()
    }
    
    private var spinLock = OS_SPINLOCK_INIT
}
