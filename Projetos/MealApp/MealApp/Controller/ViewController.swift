//
//  ViewController.swift
//  MealApp
//
//  Created by Junio Moquiuti on 1/28/16.
//  Copyright © 2016 jera. All rights reserved.
//

import UIKit

protocol addAMealDelegate{
    func add(meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var happinessTextField: UITextField!
    var delegate: addAMealDelegate?
    
    var itens = [
            Item(name: "Eggplant brownie", calories: 55),
            Item(name: "Zucchini muffin", calories: 145),
            Item(name: "Cookie", calories: 400),
            Item(name: "Coconut oil", calories: 2000),
            Item(name: "Chocolate frosting", calories: 428),
            Item(name: "Chocolate chip", calories: 390)
                ]
    var selected = Array<Item>()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = itens[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil{
            return
        }
        
        let item = itens[indexPath.row]
        
        if cell?.accessoryType == UITableViewCellAccessoryType.None{
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(item)
        }else{
            cell?.accessoryType = UITableViewCellAccessoryType.None
            if let position = selected.indexOf(item){
                selected.removeAtIndex(position)
            }
            
        
                
        }
        
    }

    
    @IBAction func addAction(sender: AnyObject) {
        
        if nameTextField == nil || happinessTextField == nil{
            return
        }
        
        let name = nameTextField!.text
        let happiness = Int(happinessTextField.text!)
        
        let meal = Meal(name: name!, happiness: happiness!)
        meal.itens = selected
        
        print("eaten: \(meal.name) \(meal.happiness) \(meal.itens)")
        
        if delegate == nil{
            return
        }
        
        delegate!.add(meal)
        
        if let navigation = navigationController{
            navigation.popViewControllerAnimated(true)
        }
    
    }
}

