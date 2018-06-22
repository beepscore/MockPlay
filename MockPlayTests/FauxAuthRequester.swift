//
//  FauxAuthRequester.swift
//  MockPlay
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation
import UserNotifications
@testable import MockPlay

public class FauxAuthRequester: UNCenterAuthRequester {

    // flag to signal if requestAuthorization was called
    var wasRequestAuthorizationCalled = false

    /// implement method required by protocol UNCenterAuthRequester.
    /// Copied this method signature from the class we are mocking,
    /// UNUserNotificationCenter.current().requestAuthorization
    /// https://www.appcoda.com/ios10-user-notifications-guide/
    public func requestAuthorization(options: UNAuthorizationOptions = [],
                              completionHandler: @escaping (Bool, Error?) -> Void) {

        // set flag to signal this method was called
        wasRequestAuthorizationCalled = true
    }

}
