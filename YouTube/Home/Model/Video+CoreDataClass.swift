//
//  Video+CoreDataClass.swift
//  YouTube
//
//  Created by buginux on 2017/8/20.
//  Copyright © 2017年 buginux. All rights reserved.
//
//

import Foundation
import CoreData


public class Video: NSManagedObject {
    
    var subtitle: String {
        get {
            var string = String()
            if let channel = channel, let name = channel.name {
                string += name
            }
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            let formattedString = formatter.string(from: NSNumber(value: numberOfViews))!
            string += " • \(formattedString) • 2 years ago"
            
            return string
        }
    }
    
    

}
