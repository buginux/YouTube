//
//  VideoCell.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    private var thumbnailImageView: AsyncImageView = {
        let imageView = AsyncImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.purple
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()

    private var profileImageView: AsyncImageView = {
        let imageView = AsyncImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 22.0
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private var separatorLine: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.lightGray
        
        return label
    }()
    
    override func commonInit() {
        super.commonInit()
        
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(separatorLine)
        contentView.addSubview(profileImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        let thumbnailImageWidth = bounds.width - 32.0
        let thumbnailImageHeight = thumbnailImageWidth * 9 / 16
        addConstraints(withFormat: "H:|-16-[v0]-16-|", views: [thumbnailImageView])
        addConstraints(withFormat: "V:|-16-[v0]-8-[v1(44)]",
                       options: .alignAllLeading,
                       views: [thumbnailImageView, profileImageView])
        
        addConstraints(withFormat: "H:[v0(44)]-8-[v1]-16-|",
                       options: .alignAllTop,
                       views: [profileImageView, titleLabel])
        addConstraints(withFormat: "V:[v0]-8-[v1]",
                       options: [.alignAllLeading, .alignAllTrailing],
                       views: [titleLabel, subtitleLabel])
        
        addConstraints(withFormat: "H:|[v0]|", views: [separatorLine])
        addConstraints(withFormat: "V:[v0]-8@750-[v1(1)]", views: [subtitleLabel, separatorLine])
        
        addConstraints([
            thumbnailImageView.heightAnchor.constraint(equalToConstant: thumbnailImageHeight),
            separatorLine.topAnchor.constraint(greaterThanOrEqualTo: profileImageView.bottomAnchor, constant: 8.0)
        ])
    }
    
    func config(withVideo video: Video) {
        titleLabel.text = video.title
        subtitleLabel.text = video.subtitle
        
        thumbnailImageView.loadImage(withURLString: video.thumbnailImageName!)
        profileImageView.loadImage(withURLString: video.channel?.profileImageName)
    }
    
    class func heightForCell(withVideo video: Video) -> CGFloat {
        var height: CGFloat = 16.0
        
        let thumbnailImageWidth = UIScreen.main.bounds.width - 32.0
        let thumbnailImageHeight = thumbnailImageWidth * 9 / 16
        height += (thumbnailImageHeight + 8.0)
        
        guard let title = video.title else {
            height += (44.0 + 8.0 + 1.0)
            return height
        }
        
        let titleWidth = thumbnailImageWidth - 44.0 - 8.0
        let boundingSize = CGSize(width: titleWidth, height: CGFloat(MAXFLOAT))
        
        var attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17.0)]
        let titleSize = (title as NSString).boundingRect(with: boundingSize, options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: attributes, context: nil).size
        height += (titleSize.height + 8.0)
        
        attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14.0)]
        let subtitleSize = (video.subtitle as NSString).boundingRect(with: boundingSize, options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: attributes, context: nil).size
        height += (subtitleSize.height + 8.0)
        
        height += 1.0
        
        return height
    }
}
