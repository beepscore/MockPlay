//
//  PushNotificationController.swift
//  MockPlay
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import Foundation


/// Reference: MocksPlayground.swift
/// https://gist.github.com/eliperkins/8f4115151497dc1953ea
public struct PushNotificationController {

    let registrar: PushNotificationRegistrar

    public init(registrar: PushNotificationRegistrar) {
        self.registrar = registrar
    }

}
