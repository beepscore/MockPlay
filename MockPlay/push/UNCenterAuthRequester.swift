//
//  UNCenterAuthRequester.swift
//  MockPlay
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation
import UserNotifications


public protocol UNCenterAuthRequester {

    /// copied this method signature from
    /// UNUserNotificationCenter.current().requestAuthorization
    /// https://www.appcoda.com/ios10-user-notifications-guide/
    func requestAuthorization(options: UNAuthorizationOptions,
                              completionHandler: @escaping (Bool, Error?) -> Void)

}
