//
//  FauxRegistrar.swift
//  MockPlay
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation
import UserNotifications

class FauxRegistrar: PushNotificationRegistrar {
    var registered = false
    func registerUserNotificationSettings(notificationSettings: UNNotificationSettings) {
        registered = true
    }
}
