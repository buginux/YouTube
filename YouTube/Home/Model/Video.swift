//
//  Video.swift
//  YouTube
//
//  Created by buginux on 2017/8/19.
//  Copyright © 2017年 buginux. All rights reserved.
//

import Foundation

class Video {
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: Int64?
    var uploadDate: Date?
    var channel: Channel?
    
    var subtitle: String {
        get {
            var string = String()
            if let channel = channel, let name = channel.name {
                string += name
            }
            
            if let numberOfViews = numberOfViews {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                let formattedString = formatter.string(from: NSNumber(value: numberOfViews))!
                string += " • \(formattedString)"
            }
            
            string += " • 2 years ago"
            
            return string
        }
    }
}

class Channel {
    var name: String?
    var profileImageName: String?
}

extension Video {
    class func sampleVideos() -> [Video] {
        let kanyeChannel = Channel()
        kanyeChannel.name = "KanyeIsTheBestChannel"
        kanyeChannel.profileImageName = "kanye_profile"
        
        let blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = kanyeChannel
        blankSpaceVideo.numberOfViews = 23932843093
        
        let badBloodVideo = Video()
        badBloodVideo.title = "Taylor Swift - Bad Blood featuring Kendrick Lamar"
        badBloodVideo.thumbnailImageName = "taylor_swift_bad_blood"
        badBloodVideo.channel = kanyeChannel
        badBloodVideo.numberOfViews = 57989654934
        
        return [blankSpaceVideo, badBloodVideo]
    }
}
