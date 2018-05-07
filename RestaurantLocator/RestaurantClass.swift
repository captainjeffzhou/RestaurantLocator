//
//  RestaurantClass.swift
//  RestaurantLocator
//
//  Created by 周成队长 on 12/9/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

class RestaurantClass: NSObject {
    
    //var restaurant: RestaurantClass?
    
    
    var name:String!
    var category:String!
    var adddate: Int64!
    var latitude:Double!
    var longitude: Double!
    var location: String!
    var notice: Bool!
    var rating: Int16!
    
    
    // Init function
    init(name:String, category:String, location:String, latitude:Double, longitude:Double, rating:Int16, notice:Bool, adddate: Int64) {
        self.name = name
        self.adddate = adddate
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
        self.rating = rating
        self.category = category
        self.notice = notice
        
    }
    
    
    
    
    
    
    
    

}
