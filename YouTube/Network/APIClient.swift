//
//  APIClient.swift
//  YouTube
//
//  Created by buginux on 2017/8/21.
//  Copyright © 2017年 buginux. All rights reserved.
//

import Foundation
import CoreData

enum APIClientError: Error {
    case invalidJSONData
}

class APIClient {
    static let youtubeURLString = "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"
    
    static func videos(fromJSON data: Data, inManagedContext context: NSManagedObjectContext) -> VideoResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard
                let videosArray = jsonObject as? [[String: Any]] else {
                    return .failure(APIClientError.invalidJSONData)
            }
            
            clearData(withContext: context)
            
            var finalVideos = [Video]()
            for videoJSON in videosArray {
                if let video = video(fromJSON: videoJSON, inManagedContext: context) {
                    finalVideos.append(video)
                }
            }
            
            if finalVideos.isEmpty && !videosArray.isEmpty {
                return .failure(APIClientError.invalidJSONData)
            }
            
            saveVideos(withContext: context)
            
            return .success(finalVideos)
        } catch let error {
            return .failure(error)
        }
    }
    
    private static func video(fromJSON json: [String: Any], inManagedContext context: NSManagedObjectContext) -> Video? {
        guard
            let title = json["title"] as? String,
            let numberOfViews = json["number_of_views"] as? Int64,
            let thumbnailURLString = json["thumbnail_image_name"] as? String else {
                return nil
        }
        
        let channelDict = json["channel"] as? [String: Any]
        
        let channelEntity = NSEntityDescription.entity(forEntityName: "Channel", in: context)!
        let c = Channel(entity: channelEntity, insertInto: context)
        if let channelDict = channelDict {
            c.profileImageName = channelDict["profile_image_name"] as? String
            c.name = channelDict["name"] as? String
        }
            
        let videoEntity = NSEntityDescription.entity(forEntityName: "Video", in: context)!
        let v = Video(entity: videoEntity, insertInto: context)
        v.title = title
        v.numberOfViews = numberOfViews
        v.thumbnailImageName = thumbnailURLString
        v.channel = c
        
        return v
    }
    
    private static func clearData(withContext context: NSManagedObjectContext) {
        do {
            let fetchRequest = NSFetchRequest<Video>(entityName: "Video")
            let videos = try context.fetch(fetchRequest)
            _ = videos.map { context.delete($0) }
            try context.save()
        } catch let error {
            print("Deleting error: \(error)")
        }
    }
    
    private static func saveVideos(withContext context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch let error {
            print("Save error: \(error)")
        }
    }
}
