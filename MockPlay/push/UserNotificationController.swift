//
//  UserNotificationController.swift
//  MockPlay
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation
import UserNotifications


/// Reference: MocksPlayground.swift
/// https://gist.github.com/eliperkins/8f4115151497dc1953ea
public struct UserNotificationController {

    // authRequester is any type that implements protocol UNCenterAuthRequester
    // e.g. app can supply UNUserNotificationCenter.current()
    // tests can supply FauxAuthRequester
    let authRequester: UNCenterAuthRequester

    // inject dependency authRequester
    public init(authRequester: UNCenterAuthRequester) {
        self.authRequester = authRequester
    }

    var user: User? {
        didSet {
            if let _ = user {
                authRequester.requestAuthorization(options: [.alert, .sound, .badge]) {
                    (granted, error) in
                    //Parse errors and track state
                }
            }
        }
    }
}
