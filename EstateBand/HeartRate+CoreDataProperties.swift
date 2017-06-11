//
//  HeartRate+CoreDataProperties.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/11.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import Foundation
import CoreData


extension HeartRate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HeartRate> {
        return NSFetchRequest<HeartRate>(entityName: "HeartRate")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var heartRate: Int32
    @NSManaged public var user: User?

}
