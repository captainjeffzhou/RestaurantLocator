//
//  detailViewController.swift
//  RestaurantLocator
//
//  Created by 周成队长 on 11/9/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit
import CoreData
//import Foundation

class detailViewController: UIViewController {
    
    var managedContext: NSManagedObjectContext?
    var appDelegate: AppDelegate?
    
    
   // var category: String!
    //var adddate: Int64!
    //var latitude:Double!
    //var longitude: Double!
    //var location: String!
    //var notice: Bool!
    //var rating: Int16!
    
    
    //@IBOutlet weak var categoryField: UITextField!
    //@IBOutlet weak var ratingField: UITextField!
    //@IBOutlet weak var dateField: UITextField!
    //@IBOutlet weak var locationField: UITextField!
    //@IBOutlet weak var nameField: UITextField!
    
    //@IBOutlet weak var longiField: UITextField!
    //@IBOutlet weak var latiField: UITextField!
    
    var restaurant: Restaurant?
    var name: String!
    //var restaurantList: [RestaurantClass] = []
    
    
    
 
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // let appDelegate = UIApplication.shared.delegate as! AppDelegate
       // managedContext = appDelegate.persistentContainer.viewContext

       // if (name != nil){ nameField.text = name}
       // else{nameField.text = "ssssss"}
       // if (location != nil){ locationField.text = location}
        //if (category != nil){ categoryField.text = name}
        //if (notice != nil){ noticeField.isOn = notice}////////////
        //if (longitude != nil){ longiField.text = "\(longitude)"}
        //if (latitude != nil){ latiField.text = "\(latitude)" }
        //if (adddate != nil){ dateField.text = "\(adddate)"}
        //if (rating != nil){ ratingField.text = "\(rating)"}
        
        
        //nameField.delegate = self
        //locationField.delegate = self
       // categoryField.delegate = self
       // ratingField.delegate = self
       // longiField.delegate = self
       // latiField.delegate = self
       // dateField.delegate = self
       // //noticeField.
        
        
        
     //   if let restObjecect = restaurant {
           // nameField.text = restObjecect.name
          //  locationField.text = restObjecect.location
          //  categoryField.text = restObjecect.category
          //  //noticeField.isOn = restObjecect.notice
          //  longiField.text = "\(restObjecect.longi)"
          //  latiField.text = "\(restObjecect.lati)"
         //   dateField.text = "\(restObjecect.adddate)"
         //   ratingField.text = "\(restObjecect.rating)"
        
    //    }
        
        
        // Do any additional setup after loading the view.
    }

  //  override func didReceiveMemoryWarning() {
  //      super.didReceiveMemoryWarning()
   //     // Dispose of any resources that can be recreated.
   // }
    
    
@IBAction func back(_ sender: Any) {
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    //Select and show
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    

}
