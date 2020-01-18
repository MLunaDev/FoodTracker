//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Diogo, Mariana de Oliveira on 17/01/2020.
//  Copyright © 2020 Luna. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    var meals : [Meal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleMeals()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        //Validates if the sender is of type MealViewController and the meal is not nil
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    //MARK: Private Methods
    private func loadSampleMeals() {
        let photoOne = UIImage(named: "mealOne")
        let photoTwo = UIImage(named: "mealTwo")
        let photoThree = UIImage(named: "mealThree")
        
        guard let mealOne = Meal(name: "Caprese Salad", photo: photoOne, rating: 4) else {
            fatalError("Unable to instantiate meal one")
        }
        
        guard let mealTwo = Meal(name: "Chicken and Potatoes", photo: photoTwo, rating:  5) else {
            fatalError("Unable to instantiate meal two")
        }
        
        guard let mealThree = Meal(name: "Pasta with Meatballs", photo: photoThree, rating: 3) else {
            fatalError("Unable to instantiate meal two")
        }
        meals += [mealOne, mealTwo, mealThree]
    }
    

}
