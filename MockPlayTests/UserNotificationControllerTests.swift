//
//  UserNotificationControllerTests.swift
//  MockPlayTests
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import XCTest
@testable import MockPlay

class UserNotificationControllerTests: XCTestCase {

    func testSetUserCallsRequestAuth() {

        let authRequester = FauxAuthRequester()
        var controller = UserNotificationController(authRequester: authRequester)

        // check setup
        XCTAssertFalse(authRequester.wasRequestAuthorizationCalled)

        // trigger call to method under test
        controller.user = User()

        XCTAssertTrue(authRequester.wasRequestAuthorizationCalled, "setting user should request auth")
    }
}
