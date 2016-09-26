//
//  PKNetworkActivityController.swift
//  PKNetworkActivityController
//
//  Created by Philip Kluz on 6/19/14.
//  Copyright (c) 2014 NSExceptional. All rights reserved.
//

import UIKit

@objc (PKNetworkActivityController)
open class NetworkActivityController : NSObject {
    
    open class var sharedController: NetworkActivityController {
        return Constants.sharedController
    }
    
    /// The number of activities in progress. Iff the number is greater than 0, the network activity indicator is visible (unless modified by an external source).
    open var numberOfRegisteredActivities: Int = 0
    
    /// Registers for network activity.
    open func registerActivity() {
        withUnsafeMutablePointer(to: &spinLock, OSSpinLockLock)
        
        numberOfRegisteredActivities += 1
        if numberOfRegisteredActivities > 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        withUnsafeMutablePointer(to: &spinLock, OSSpinLockUnlock)
    }
    
    /// Deregisters from network activity.
    open func deregisterActivity() {
        withUnsafeMutablePointer(to: &spinLock, OSSpinLockLock)
        
        let newValue = numberOfRegisteredActivities - 1
        numberOfRegisteredActivities = newValue >= 0 ? newValue : 0
        if numberOfRegisteredActivities == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
        withUnsafeMutablePointer(to: &spinLock, OSSpinLockUnlock)
    }
    
    // #MARK: Private
    
    fileprivate struct Constants {
        static let sharedController = NetworkActivityController()
    }
    
    fileprivate var spinLock = OS_SPINLOCK_INIT
}
