//
//  Restaurant+CoreDataProperties.swift
//  RestaurantLocator
//
//  Created by 周成队长 on 12/9/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import Foundation
import CoreData


extension Restaurant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }

    @NSManaged public var adddate: Int64
    @NSManaged public var category: String?
    @NSManaged public var lati: Double
    @NSManaged public var location: String?
    @NSManaged public var longi: Double
    @NSManaged public var name: String?
    @NSManaged public var notice: Bool
    @NSManaged public var rating: Int16
    @NSManaged public var belongcategory: Category?

}
