//
//  AppDelegate.swift
//  DemoProductName
//
//  Created by zhaofei on 2017/1/25.
//  Copyright © 2017年 organizationName. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

var place = "北京"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        Thread.sleep(forTimeInterval: 5.0)
        let tbc = UITabBarController()
        let sub1VC = FirstSubViewController()
        let sub2VC = SecondSubViewController()
        let sub2NC = UINavigationController(rootViewController: sub2VC)
        let sub3VC = ThirdSubViewController()
        tbc.viewControllers = [sub1VC, sub2NC, sub3VC]
        let tabBar = tbc.tabBar
        let items = tabBar.items
        tabBar.barTintColor = UIColor.white
        for i in 0...2 {
            items?[i].title = "item\(i)"
            items?[i].image = UIImage(named: "item_icon_\(i)")?.withRenderingMode(.alwaysOriginal)
            items?[i].selectedImage = UIImage(named: "item_icon_selected_\(i)")?.withRenderingMode(.alwaysOriginal)
        }

        self.window?.rootViewController = tbc
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

