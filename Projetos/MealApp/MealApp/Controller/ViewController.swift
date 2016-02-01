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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, addNewItemDelegate {


    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var happinessTextField: UITextField!
    var delegate: addAMealDelegate?
    @IBOutlet var tableView: UITableView!
    
    var itens = Array<Item>()
    var selected = Array<Item>()
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("showNewItem"))
        navigationItem.rightBarButtonItem = newItemButton
        
        itens = Dao().loaditens()
    }
    
    
    func addItem(item: Item){
        itens.append(item)
        
        Dao().saveItens(itens)
        
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller: self).show("Unexpected error, but the item was added.")
        }
            
        
    }
    
    func showNewItem(){
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController{
            navigation.pushViewController(newItem, animated: true)
        }else {
            Alert(controller: self).show()
        }
    }
    
    
    
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
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            
            let item = itens[indexPath.row]
            
            if cell.accessoryType == UITableViewCellAccessoryType.None{
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                selected.append(item)
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.None
                if let position = selected.indexOf(item){
                    selected.removeAtIndex(position)
                } else {
                    Alert(controller: self).show()
                }
            }
            
        } else {
            Alert(controller: self).show()
        }
        
    }

    func getMealFromForm() -> Meal? {
        if nameTextField == nil || happinessTextField == nil{
            return nil
        }
        
        let name = nameTextField!.text
        let happiness = Int(happinessTextField.text!)
        
        if happiness == nil {
            return nil
        }
        
        let meal = Meal(name: name!, happiness: happiness!)
        meal.itens = selected
        
        print("eaten: \(meal.name) \(meal.happiness) \(meal.itens)")
        
        return meal
    }
    
    @IBAction func addAction(sender: AnyObject) {
        
        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.add(meal)
                
                if let navigation = navigationController{
                    navigation.popViewControllerAnimated(true)
                } else {
                    Alert(controller: self).show()
                }
            }
            return
        }
         Alert(controller: self).show()
    }
    
}

