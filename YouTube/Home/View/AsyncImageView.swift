//
//  AsyncImageView.swift
//  YouTube
//
//  Created by buginux on 2017/8/25.
//  Copyright © 2017年 buginux. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class AsyncImageView: UIImageView {
    
    var imageURLString: String?
    
    func loadImage(withURLString urlString: String?) {
        guard let urlString = urlString else { return }
        imageURLString = urlString
        
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
                    
                    if self.imageURLString != urlString { return }
                    
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            })
            dataTask.resume()
        }
    }
}
