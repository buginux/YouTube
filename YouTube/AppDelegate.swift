//
//  AppDelegate.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coreDataStack = CoreDataStack(modelName: "YouTube")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let layout = UICollectionViewFlowLayout()
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        homeViewController.managedContext = coreDataStack.context
        window?.rootViewController = UINavigationController(rootViewController: homeViewController)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        application.statusBarStyle = .lightContent
        setupAppearance()

        insertSampleVideos()
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
    
    private func insertSampleVideos() {
        let fetchRequest = NSFetchRequest<Video>(entityName: "Video")
        fetchRequest.predicate = NSPredicate(format: "title == %@", "Taylor Swift - Blank Space")
        
        do {
            let count = try coreDataStack.context.count(for: fetchRequest)
            if count > 0 {
                return
            }
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
        let channelEntity = NSEntityDescription.entity(forEntityName: "Channel", in: coreDataStack.context)
        let kanyeChannel = Channel(entity: channelEntity!, insertInto: coreDataStack.context)
        kanyeChannel.name = "KanyeIsTheBestChannel"
        kanyeChannel.profileImageName = "kanye_profile"
        
        let videoEntity = NSEntityDescription.entity(forEntityName: "Video", in: coreDataStack.context)
        let blankSpaceVideo = Video(entity: videoEntity!, insertInto: coreDataStack.context)
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = kanyeChannel
        blankSpaceVideo.numberOfViews = 23932843093
        
        let badBloodVideo = Video(entity: videoEntity!, insertInto: coreDataStack.context)
        badBloodVideo.title = "Taylor Swift - Bad Blood featuring Kendrick Lamar"
        badBloodVideo.thumbnailImageName = "taylor_swift_bad_blood"
        badBloodVideo.channel = kanyeChannel
        badBloodVideo.numberOfViews = 57989654934

        coreDataStack.saveContext()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
}

