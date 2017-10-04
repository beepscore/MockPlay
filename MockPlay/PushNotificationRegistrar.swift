//
//  PushNotificationRegistrar.swift
//  MockPlay
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import UIKit

protocol PushNotificationRegistrar {

    // FIXME: 'UIUserNotificationSettings' was deprecated in iOS 10.0: Use UserNotifications Framework's UNNotificationSettings
    func registerUserNotificationSettings(notificationSettings: UIUserNotificationSettings)
}
