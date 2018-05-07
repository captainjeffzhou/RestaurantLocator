//
//  restaurantViewController.swift
//  RestaurantLocator
//
//  Created by 周成队长 on 11/9/17.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit
import CoreData

class restaurantViewController: UITableViewController {
    
    
    var name: String? // Category name
    var restaurants: [Restaurant]?
    var restaurant: Restaurant?
    var managedContext: NSManagedObjectContext?
    var appDelegate: AppDelegate?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        
        
        // Category name not nil
        if(name != nil) {
            ///////
            fetchRestaurants()
            
            //let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell")
            
            
            // Set cell title to game name
            //let game = filteredGameList![indexPath.row]
           // cell?.textLabel?.text = "aaaa"

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

    
    
    
    
    

    func fetchRestaurants() {
        let restaurantFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Restaurant")
        restaurantFetch.predicate = NSPredicate(format: "belongcategory.title = %@", name!)
        //restaurantFetch.predicate = NSPr
        do {
            // Fetch all restaurant from "Restaurant" entity
            restaurants = try managedContext?.fetch(restaurantFetch) as? [Restaurant]
        } catch {
            fatalError("Failed to fetch video games: \(error)")
        }
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
        if let count = restaurants?.count
        {
            return count
        }
        return 0;
    }
    
    
    
 // cell text implementation
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath)
        
        let restaurant = restaurants![indexPath.row]
        cell.textLabel?.text = restaurant.name
        switch restaurant.name!
        {
        case "Family food":
            cell.imageView?.image = #imageLiteral(resourceName: "vet1")
            break
        case "Vetnam cake":
            cell.imageView?.image = #imageLiteral(resourceName: "vet2")
            break
        case "Oak vet restaurant":
            cell.imageView?.image = #imageLiteral(resourceName: "vet3")
            break
            
            
        case "Italy feeling":
            cell.imageView?.image = #imageLiteral(resourceName: "italy1")
            break
        case "Yami Italy":
            cell.imageView?.image = #imageLiteral(resourceName: "italy2")
            break
        case "Italy familys":
            cell.imageView?.image = #imageLiteral(resourceName: "italy3")
            break
            
            
        case "John's Pizza":
            cell.imageView?.image = #imageLiteral(resourceName: "piz1")
            break
        case "Tom's Pizza":
            cell.imageView?.image = #imageLiteral(resourceName: "piz2")
            break
        case "Pizza House":
            cell.imageView?.image = #imageLiteral(resourceName: "piz3")
            break
        case "Pizza World":
            cell.imageView?.image = #imageLiteral(resourceName: "piz4")
            break
        default:
            cell.imageView?.image = #imageLiteral(resourceName: "default")
            
        }
        
        return cell
    }
    
    
    
    
    
//Executed before click go to detail page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "toDetailSegue") {
            
            // selectedRest is the selected restaurant from all fetched restaurant (A list)
            let selectedRest = restaurants![(tableView.indexPathForSelectedRow?.row)!]
            //let destination: detailViewController = segue.destination as! detailViewController
            
            
            let destination: testViewController = segue.destination as! testViewController
            
            destination.name = selectedRest.name
            destination.restaurant = selectedRest
            
            
        }
    }
    
    
    
    
    
    
    
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
