//
//  User+CoreDataProperties.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/12.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var account: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var restInterval: Int32
    @NSManaged public var sex: Bool
    @NSManaged public var workNumber: Int32
    @NSManaged public var heartRate: NSSet?

}

// MARK: Generated accessors for heartRate
extension User {

    @objc(addHeartRateObject:)
    @NSManaged public func addToHeartRate(_ value: HeartRate)

    @objc(removeHeartRateObject:)
    @NSManaged public func removeFromHeartRate(_ value: HeartRate)

    @objc(addHeartRate:)
    @NSManaged public func addToHeartRate(_ values: NSSet)

    @objc(removeHeartRate:)
    @NSManaged public func removeFromHeartRate(_ values: NSSet)

}
