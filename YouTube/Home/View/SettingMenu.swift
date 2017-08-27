//
//  SettingMenu.swift
//  YouTube
//
//  Created by buginux on 2017/8/26.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

class SettingMenu: UIView {
    
    lazy var menu: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        
        menu.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 200)
        addSubview(menu)
    }
    
    func show() {
        alpha = 0.0
        menu.frame.origin.y = frame.height
        UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            self.alpha = 1.0
            self.menu.frame.origin.y = self.frame.height - 200
        }, completion: nil)
    }
    
    static func show(inView view: UIView) {
        let menu = SettingMenu(frame: view.frame)
        
        view.addSubview(menu)
        menu.show()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.33, animations: {
            self.alpha = 0.0
            self.menu.frame.origin.y = self.frame.height + 200
        }, completion: { finished in
            self.removeFromSuperview()
        })
    }
}
