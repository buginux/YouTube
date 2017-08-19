//
//  VideoCell.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()

    var profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22.0
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    var separatorLine: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift - Blank Space"
        
        return label
    }()
    
    var subtitleTextView: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.lightGray
        
        return textView
    }()
    
    override func commonInit() {
        super.commonInit()
        
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
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.0, constant: 30.0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .leading, relatedBy: .equal, toItem: profileImageView, attribute: .trailing, multiplier: 1.0, constant: 8.0))
        addConstraints([NSLayoutConstraint(item: subtitleTextView, attribute: .trailing, relatedBy: .equal, toItem: thumbnailImageView, attribute: .trailing, multiplier: 1.0, constant: 0.0)])
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 8.0))
        
    }
}
