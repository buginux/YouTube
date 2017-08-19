//
//  Video+CoreDataProperties.swift
//  YouTube
//
//  Created by buginux on 2017/8/20.
//  Copyright © 2017年 buginux. All rights reserved.
//
//

import Foundation
import CoreData


extension Video {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Video> {
        return NSFetchRequest<Video>(entityName: "Video")
    }

    @NSManaged public var thumbnailImageName: String?
    @NSManaged public var title: String?
    @NSManaged public var numberOfViews: Int64
    @NSManaged public var uploadDate: NSDate?
    @NSManaged public var channel: Channel?

}
