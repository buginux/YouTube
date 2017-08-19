//
//  BaseCell.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
    }
}
