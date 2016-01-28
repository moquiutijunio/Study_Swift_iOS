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

class ViewController: UIViewController {


    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var happinessTextField: UITextField!
    var delegate: MealsTableViewController?
    
    @IBAction func addAction(sender: AnyObject) {
        
        if nameTextField == nil || happinessTextField == nil{
            return
        }
        
        let name = nameTextField!.text
        let happiness = Int(happinessTextField.text!)
        
        let meal = Meal(name: name!, happiness: happiness!)
        
        print("eaten: \(meal.name) \(meal.happiness)")
        
        if delegate == nil{
            return
        }
        
        delegate!.add(meal)
        
        if let navigation = navigationController{
            navigation.popViewControllerAnimated(true)
        }
    
    }
}

