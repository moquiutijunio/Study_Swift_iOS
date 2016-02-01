//
//  MealsTableViewController.swift
//  MealApp
//
//  Created by Junio Moquiuti on 1/28/16.
//  Copyright © 2016 jera. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, addAMealDelegate {
    
    var meals = Array<Meal>()
    
    func add(meal: Meal){
        meals.append(meal)
        Dao().saveMeals(meals)
        tableView.reloadData()
    }
    
    func getUserDir() -> String{
        let userDisc = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        return userDisc[0] as String
    }
    
    override func viewDidLoad() {
        meals = Dao().loadmeals()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal"{
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showDetails:"))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Began {
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            
            if indexPath == nil {
                return
            }
            
            let row = indexPath!.row
            let meal = meals[row]
            
            
            RemoveViewController(controller: self).show(meal, handler: { action in
                self.meals.removeAtIndex(row)
                self.tableView.reloadData()
                
            })
            
        }
        
    }
    
}
