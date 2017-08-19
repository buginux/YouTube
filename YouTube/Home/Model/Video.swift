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
    var subtitle: String?
}

extension Video {
    class func sampleVideos() -> [Video] {
//        var kanyeChannel = Channel()
//        kanyeChannel.name = "KanyeIsTheBestChannel"
//        kanyeChannel.profileImageName = "kanye_profile"
        
        let blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
//        blankSpaceVideo.subtitle = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
//        blankSpaceVideo.channel = kanyeChannel
//        blankSpaceVideo.numberOfViews = 23932843093
        
        let badBloodVideo = Video()
        badBloodVideo.title = "Taylor Swift - Bad Blood featuring Kendrick Lamar"
        badBloodVideo.thumbnailImageName = "taylor_swift_bad_blood"
        badBloodVideo.subtitle = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
//        badBloodVideo.channel = kanyeChannel
//        badBloodVideo.numberOfViews = 57989654934
        
        return [blankSpaceVideo, badBloodVideo]
    }
}
