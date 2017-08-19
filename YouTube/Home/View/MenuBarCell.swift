//
//  MenuBarCell.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

class MenuBarCell: BaseCell {
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
//        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override func commonInit() {
        super.commonInit()
        
        addSubview(imageView)
        
        addConstraints(withFormat: "H:[v0(28)]", views: [imageView])
        addConstraints(withFormat: "V:[v0(28)]", views: [imageView])
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    }
    
    func configWith(image: String) {
        imageView.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
    }
}
