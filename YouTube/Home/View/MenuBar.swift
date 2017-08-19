//
//  MenuBar.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    fileprivate let menuImages = ["home", "trending", "subscriptions", "account"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        addSubview(collectionView)
        
        addConstraints(withFormat: "H:|[v0]|", views: [collectionView])
        addConstraints(withFormat: "V:|[v0]|", views: [collectionView])
    
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: "CellIdentifier")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 0)) {
            let selectedIndexPath = IndexPath(item: 0, section: 0)
            self.collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition(rawValue: 0))
        }
    }
}

// MARK: UICollectionViewDataSource

extension MenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! MenuBarCell
    
        cell.configWith(image: menuImages[indexPath.item])
        
        return cell
    }
}

// MARK: UICollectionViewDelegate

extension MenuBar: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDelegateFlowLayout

extension MenuBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / CGFloat(collectionView.numberOfItems(inSection: 0));
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
}
