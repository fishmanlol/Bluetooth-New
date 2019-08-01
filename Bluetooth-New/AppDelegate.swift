//
//  AppDelegate.swift
//  Bluetooth-New
//
//  Created by Yi Tong on 7/30/19.
//  Copyright © 2019 Yi Tong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let tabController = TYTabBarController()
        tabController.viewControllers = [VitalSignDataViewController(), DeviceCategoryViewController()]
        tabController.title = "Vital Sign"
        let navController = UINavigationController(rootViewController: tabController)
        window!.rootViewController = navController
        
        
        window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

