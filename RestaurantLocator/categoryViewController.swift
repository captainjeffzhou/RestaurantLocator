//
//  categoryViewController.swift
//  RestaurantLocator
//
//  Created by 周成队长 on 11/9/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit
import CoreData

class categoryViewController: UITableViewController {
    
    
    
   
    
    
    var cateList: [Category]?
    var managedContext: NSManagedObjectContext?
    var appDelegate: AppDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        
        
        
        fetchAllCate()
        
        if cateList?.count == 0 {
            createDefaultCate()
            fetchAllCate()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    
    
    
    
    

    @IBAction func order(_ sender: Any) {
        
        let title = NSLocalizedString("A Short Title is Best", comment: "")
        let message = NSLocalizedString("A message should be a short, complete sentence.", comment: "")
        let cancelButtonTitle = NSLocalizedString("Cancel", comment: "")
        let otherButtonTitleOne = NSLocalizedString("Choice One", comment: "")
        let otherButtonTitleTwo = NSLocalizedString("Choice Two", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create the actions.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { action in
            NSLog("The \"Other\" alert's cancel action occured.")
        }
        
        let otherButtonOneAction = UIAlertAction(title: otherButtonTitleOne, style: .default) { _ in
            NSLog("The \"Other\" alert's other button one action occured.")
        }
        
        let otherButtonTwoAction = UIAlertAction(title: otherButtonTitleTwo, style: .default) { _ in
            NSLog("The \"Other\" alert's other button two action occured.")
        }
        
        // Add the actions.
        alertController.addAction(cancelAction)
        alertController.addAction(otherButtonOneAction)
        alertController.addAction(otherButtonTwoAction)
        
        present(alertController, animated: true, completion: nil)
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let count = cateList?.count {
            return count
        }
        
        return 0;
    }

    
    
    //Select and show
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "toRestaurantSegue") {
            
            let selectedCate = cateList![(tableView.indexPathForSelectedRow?.row)!]
            let destination: restaurantViewController = segue.destination as! restaurantViewController
            
            destination.name = selectedCate.title
            //destination.restaurant = selectedCate
        }
    }    
    
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        
        // Get the categories from the category list
        let cate = cateList![indexPath.row]
        
        // Set cell title to game name
        cell.textLabel?.text = cate.title
        switch cate.title!
        {
        case "Italian":
            cell.imageView?.image = #imageLiteral(resourceName: "vet1")
            break
        case "Vetnam":
            cell.imageView?.image = #imageLiteral(resourceName: "vet2")
            break
        case "Pizza":
            cell.imageView?.image = #imageLiteral(resourceName: "vet3")
            break
            
            
        case "India":
            cell.imageView?.image = #imageLiteral(resourceName: "italy1")
            break
        case "China":
            cell.imageView?.image = #imageLiteral(resourceName: "italy2")
            break
       
        default:
            cell.imageView?.image = #imageLiteral(resourceName: "piz1")
            
        }
        
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    // MARK: - Populate Data
    func createDefaultCate() {
        // Create default category
        let one = createManagedCate(name: "Pizza")
        let two = createManagedCate(name: "Vetnam")
        let three = createManagedCate(name: "Italian")
        
        
        one.addToHasrestaurant(createManagedRest(category: "Pizza", lati: -37.804, longi: 144.968, notice: true, location: "Melbourne CBD", name: "John's Pizza", adddate: 20170309, rating: 3))
        one.addToHasrestaurant(createManagedRest(category: "Pizza", lati: -37.875, longi: 145.04, notice: true, location: "Caulfield", name: "Tom's Pizza", adddate: 20170524, rating: 4))
        one.addToHasrestaurant(createManagedRest(category: "Pizza", lati: -37.838, longi: 144.987, notice: true, location: "SouthYarra", name: "Pizza House", adddate: 20170703, rating: 5))
        one.addToHasrestaurant(createManagedRest(category: "Pizza", lati: -37.886, longi: 145.058, notice: true, location: "Carnegie", name: "Pizza World", adddate:20170302, rating: 1))
        //one.addToHasrestaurant(createManagedCate(category: "Pizza", lati: , longi: , notice: true, location: "", name: "", adddate:)
            
            
        two.addToHasrestaurant(createManagedRest(category: "Vetnam", lati: -37.889, longi: 145.041, notice: true, location: "GlenHuntly", name: "Family food", adddate: 20170730, rating: 3))
        two.addToHasrestaurant(createManagedRest(category: "Vetnam", lati: -37.865, longi: 145.029, notice: true, location: "Malven", name: "Vetnam cake", adddate: 20170318, rating: 4))
        two.addToHasrestaurant(createManagedRest(category: "Vetnam", lati: -37.9016, longi: 145.083, notice: true, location: "Oakleigh", name: "Oak vet restaurant", adddate:20160924, rating: 5))
        //two.addToHasrestaurant(createManagedCate(category: "Vetnam", lati: , longi: , notice: true, location: "", name: "", adddate:)
        //two.addToHasrestaurant(createManagedCate(category: "Vetnam", lati: , longi: , notice: true, location: "", name: "", adddate:)
        
            
        three.addToHasrestaurant(createManagedRest(category: "Italian", lati: -37.865, longi: 145.053, notice: true, location: "Glen Iris", name: "Italy feeling", adddate:20170421, rating: 5))
        three.addToHasrestaurant(createManagedRest(category: "Italian", lati: -37.899, longi: 145, notice: true, location: "Brighton", name: "Yami Italy", adddate: 20170503, rating: 2))
        three.addToHasrestaurant(createManagedRest(category: "Italian", lati: -37.912, longi: 145.139, notice: true, location: "Clayton", name: "Italy familys", adddate:20170507, rating: 3))
        //three.addToHasrestaurant(createManagedCate(category: "Italian", lati: , longi: , notice: true, location: "", name: "", adddate:)
        //three.addToHasrestaurant(createManagedCate(category: "Italian", lati: , longi: , notice: true, location: "", name: "", adddate:)
            

        appDelegate?.saveContext()
        
    }
    
    
    
    
    // Used for Create restaurant
    func createManagedRest(category: String, lati: Double, longi: Double, notice: Bool, location: String, name: String, adddate: Int64, rating: Int16) -> Restaurant {
        let rest = NSEntityDescription.insertNewObject(forEntityName: "Restaurant", into: managedContext!) as! Restaurant
        rest.name = name
        rest.category = category
        rest.lati = lati
        rest.longi = longi
        rest.adddate = adddate
        rest.name = name
        rest.location = location
        rest.rating = rating
        
        return rest
    }
    
    
    // Used for Create category
    func createManagedCate(name: String) -> Category {
        let cate = NSEntityDescription.insertNewObject(forEntityName: "Category", into: managedContext!) as! Category
        cate.title = name
        
        return cate
    }
    
    
    
    
    
    ///////////// Fetch all categories from CoreData
    func fetchAllCate() {
        
        //Fetch data from "Category" Entity
        let cateFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Category")
        
        do {
            
            //Fetch data from "Category" Entity
            cateList = try managedContext?.fetch(cateFetch) as? [Category]
            
        } catch {
            fatalError("Failed to fetch video games: \(error)")
        }
    }
    
    
    
    
    
    
    
    
    

}
