//
//  SettingMenu.swift
//  YouTube
//
//  Created by buginux on 2017/8/26.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

class SettingMenu: UIView {
    
    static func show(inView view: UIView) {
        let menu = SettingMenu(frame: view.frame)
        menu.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        
        view.addSubview(menu)
        
        menu.alpha = 0.0
        UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            menu.alpha = 1.0
            
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.33, animations: {
            self.alpha = 0.0
        }, completion: { finished in
            self.removeFromSuperview()
        })
    }
}
