//
//  AppDelegate.swift
//  CallKitSampler
//
//  Created by Fumiya Tanaka on 2019/05/07.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let viewController = UIStoryboard(name: "ViewController", bundle: nil).instantiateInitialViewController() else { return true }
        window = UIWindow()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

