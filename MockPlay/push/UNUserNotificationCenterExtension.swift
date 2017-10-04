//
//  UNUserNotificationCenterExtension.swift
//  MockPlay
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import UIKit
import UserNotifications

extension UNUserNotificationCenter: UNCenterAuthRequester {

    /// UNUserNotificationCenter already implements UNCenterAuthRequester protocol,
    /// because UNCenterAuthRequester protocol just copied signature of
    /// UNUserNotificationCenter.current().requestAuthorization

}
