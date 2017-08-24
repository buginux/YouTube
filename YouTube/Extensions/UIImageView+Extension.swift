
//
//  UIImage+Extension.swift
//  YouTube
//
//  Created by buginux on 2017/8/24.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(withURLString urlString: String?) {
        guard let urlString = urlString else { return }
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            })
            dataTask.resume()
        }
    }
}
