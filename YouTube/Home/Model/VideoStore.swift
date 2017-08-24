//
//  VideoStore.swift
//  YouTube
//
//  Created by buginux on 2017/8/21.
//  Copyright © 2017年 buginux. All rights reserved.
//

import Foundation
import CoreData

enum VideoResult {
    case success([Video])
    case failure(Error)
}

class VideoStore {
    private let managedContext: NSManagedObjectContext
    
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func fetchVideos(completion: @escaping (VideoResult) -> Void) {
        let url = URL(string: APIClient.youtubeURLString)!
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { [unowned self] (data, response, error) in
            let result = self.processVideosRequest(data: data, error: error)
        }
        task.resume()
    }
    
    private func processVideosRequest(data: Data?, error: Error?) -> VideoResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return APIClient.videos(fromJSON: jsonData, inManagedContext:self.managedContext)
    }
}
