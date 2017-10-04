//
//  PushNotificationRegistrar.swift
//  MockPlay
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import UserNotifications

protocol PushNotificationRegistrar {

    // https://www.appcoda.com/ios10-user-notifications-guide/
    func registerUserNotificationSettings(notificationSettings: UNNotificationSettings)
}
