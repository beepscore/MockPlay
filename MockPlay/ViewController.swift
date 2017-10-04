//
//  ViewController.swift
//  MockPlay
//
//  Created by Steve Baker on 10/4/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    let authRequester: UNCenterAuthRequester = UNUserNotificationCenter.current()
    var controller: UserNotificationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        controller = UserNotificationController(authRequester: authRequester)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

