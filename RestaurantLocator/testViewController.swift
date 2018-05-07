//
//  testViewController.swift
//  RestaurantLocator
//
//  Created by 周成队长 on 12/9/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class testViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var img: UIImageView!
    var managedContext: NSManagedObjectContext?
    var appDelegate: AppDelegate?

    var restaurant: Restaurant?
    var name: String!
    
    
    @IBAction func `switch`(_ sender: Any) {
    }
    @IBOutlet weak var rateF: UITextField!
    @IBAction func saveDetail(_ sender: Any) {
    }
    @IBAction func clearDetail(_ sender: Any) {
    }
    
    
    @IBOutlet weak var longF: UITextField!
    @IBOutlet weak var latF: UITextField!
    @IBOutlet weak var locationF: UITextField!
    @IBOutlet weak var dateF: UITextField!
    @IBOutlet weak var cateF: UITextField!
    @IBOutlet weak var nameF: UITextField!
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        
        nameF.delegate = self
        locationF.delegate = self
         cateF.delegate = self
         rateF.delegate = self
         longF.delegate = self
        latF.delegate = self
         dateF.delegate = self
        
        // //noticeField.
        
        
        
           if let restObjecect = restaurant {
         nameF.text = restObjecect.name
          locationF.text = restObjecect.location
          cateF.text = restObjecect.category
          //noticeF.isOn = restObjecect.notice
           longF.text = "\(restObjecect.longi)"
         latF.text = "\(restObjecect.lati)"
           dateF.text = "\(restObjecect.adddate)"
           rateF.text = "\(restObjecect.rating)"
            
            switch restObjecect.name!
            {
            case "Family food":
                img.image = #imageLiteral(resourceName: "vet1")
                break
            case "Vetnam cake":
                img.image = #imageLiteral(resourceName: "vet2")
                break
            case "Oak vet restaurant":
                img.image = #imageLiteral(resourceName: "vet3")
                break
           
                
            case "Italy feeling":
                img.image = #imageLiteral(resourceName: "italy1")
                break
            case "Yami Italy":
                img.image = #imageLiteral(resourceName: "italy2")
                break
            case "Italy familys":
                img.image = #imageLiteral(resourceName: "italy3")
                break
            
                
            case "John's Pizza":
                img.image = #imageLiteral(resourceName: "piz1")
                break
            case "Tom's Pizza":
                img.image = #imageLiteral(resourceName: "piz2")
                break
            case "Pizza House":
                img.image = #imageLiteral(resourceName: "piz3")
                break
            case "Pizza World":
                img.image = #imageLiteral(resourceName: "piz4")
                break
            default:
                img.image = #imageLiteral(resourceName: "default")
        
            }
            
            
        
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
