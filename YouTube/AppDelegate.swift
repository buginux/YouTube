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
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        window?.rootViewController = UINavigationController(rootViewController: homeViewController)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        application.statusBarStyle = .lightContent
        setupAppearance()

        return true
    }
    
    func setupAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
        window?.addSubview(statusBarBackgroundView)
        
        window?.addConstraints(withFormat: "H:|[v0]|", views: [statusBarBackgroundView])
        window?.addConstraints(withFormat: "V:|[v0(20)]", views: [statusBarBackgroundView])
    }
}

