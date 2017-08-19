//
//  VideoCell.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    var separatorLine: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.black
        
        return view
    }()
    
    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22.0
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.purple
        
        return label
    }()
    
    var subtitleTextView: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.cyan
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(separatorLine)
        contentView.addSubview(profileImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleTextView)
        
        addConstraints(withFormat: "H:|-16-[v0]-16-|", views: [thumbnailImageView])
        addConstraints(withFormat: "H:|-16-[v0(44)]", views: [profileImageView])
        addConstraints(withFormat: "H:|[v0]|", views: [separatorLine])
        
        addConstraints(withFormat: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: [thumbnailImageView, profileImageView, separatorLine])
        
        addConstraints(withFormat: "V:[v0(20)]", views: [titleLabel])
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1.0, constant: 8.0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: profileImageView, attribute: .trailing, multiplier: 1.0, constant: 8.0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: thumbnailImageView, attribute: .trailing, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.0, constant: 20.0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .leading, relatedBy: .equal, toItem: profileImageView, attribute: .trailing, multiplier: 1.0, constant: 8.0))
        addConstraints([NSLayoutConstraint(item: subtitleTextView, attribute: .trailing, relatedBy: .equal, toItem: thumbnailImageView, attribute: .trailing, multiplier: 1.0, constant: 0.0)])
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 8.0))
        
    }
}
