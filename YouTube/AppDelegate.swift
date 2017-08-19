//
//  AppDelegate.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = HomeViewController(collectionViewLayout: layout)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        return true
    }
}

