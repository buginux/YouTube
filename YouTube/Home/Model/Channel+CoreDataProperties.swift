//
//  Channel+CoreDataProperties.swift
//  YouTube
//
//  Created by buginux on 2017/8/20.
//  Copyright © 2017年 buginux. All rights reserved.
//
//

import Foundation
import CoreData


extension Channel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Channel> {
        return NSFetchRequest<Channel>(entityName: "Channel")
    }

    @NSManaged public var name: String?
    @NSManaged public var profileImageName: String?
    @NSManaged public var video: NSSet?

}

// MARK: Generated accessors for video
extension Channel {

    @objc(addVideoObject:)
    @NSManaged public func addToVideo(_ value: Video)

    @objc(removeVideoObject:)
    @NSManaged public func removeFromVideo(_ value: Video)

    @objc(addVideo:)
    @NSManaged public func addToVideo(_ values: NSSet)

    @objc(removeVideo:)
    @NSManaged public func removeFromVideo(_ values: NSSet)

}
