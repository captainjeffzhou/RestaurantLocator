//
//  Category+CoreDataProperties.swift
//  RestaurantLocator
//
//  Created by 周成队长 on 12/9/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var title: String?
    @NSManaged public var hasrestaurant: NSSet?

}

// MARK: Generated accessors for hasrestaurant
extension Category {

    @objc(addHasrestaurantObject:)
    @NSManaged public func addToHasrestaurant(_ value: Restaurant)

    @objc(removeHasrestaurantObject:)
    @NSManaged public func removeFromHasrestaurant(_ value: Restaurant)

    @objc(addHasrestaurant:)
    @NSManaged public func addToHasrestaurant(_ values: NSSet)

    @objc(removeHasrestaurant:)
    @NSManaged public func removeFromHasrestaurant(_ values: NSSet)

}
