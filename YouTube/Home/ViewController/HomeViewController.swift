//
//  ViewController.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    private var videos = Video.sampleVideos()
    
    private let menuBar: MenuBar = {
        let menu = MenuBar(frame: .zero)
        
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
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
        print("more")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! VideoCell
        
        let video = self.videos[indexPath.item]
        cell.config(withVideo: video)
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let video = videos[indexPath.item]
        let height = VideoCell.heightForCell(withVideo: video)
        
        return CGSize(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}















