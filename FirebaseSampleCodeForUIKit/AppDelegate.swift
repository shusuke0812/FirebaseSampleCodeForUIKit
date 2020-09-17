//
//  AppDelegate.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/6/20.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Firebase初期化
        FirebaseApp.configure()
        return true
    }
}

