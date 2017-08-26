//
//  ViewController.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UICollectionViewController {
    
    var store: VideoStore!
    var managedContext: NSManagedObjectContext!
    
    lazy var fetchedResultsController: NSFetchedResultsController<Video> = {
        let fetchRequest = NSFetchRequest<Video>(entityName: "Video")
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedContext, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
        return controller
    }()
    
    private let menuBar: MenuBar = {
        let menu = MenuBar(frame: .zero)
        
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        
        store.fetchVideos { [unowned self] (videoResult)in
            switch videoResult {
            case let .success(videos):
                print("Successfully found \(videos.count) videos")
                
                do {
                    try self.fetchedResultsController.performFetch()
                } catch let error {
                    print("Save error: \(error)")
                }
                
            case let .failure(error):
                print("Error fetching videos: \(error)")
            }
        }
    }
    
    // MARK: Private
    
    private func initViews() {
        setupNavigationBar()
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "CellIdentifier")
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        titleLabel.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        
        view.addSubview(menuBar)
        view.addConstraints(withFormat: "H:|[v0]|", views: [menuBar])
        view.addConstraints(withFormat: "V:|[v0(50)]", views: [menuBar])
        
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch(sender:)))
        
        let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore(sender:)))
        
        navigationItem.rightBarButtonItems = [moreButtonItem, searchButtonItem]
    }
    
    @objc func handleSearch(sender: UIButton) {
        print("search")
    }
    
    @objc func handleMore(sender: UIButton) {
        guard let window = UIApplication.shared.keyWindow else { return }
        
        SettingMenu.show(inView: window)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects!.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! VideoCell
        
        let video = fetchedResultsController.fetchedObjects![indexPath.item]
        cell.config(withVideo: video)
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let video = fetchedResultsController.fetchedObjects![indexPath.item]
        let height = VideoCell.heightForCell(withVideo: video)
        
        return CGSize(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        collectionView?.reloadData()
    }
}















