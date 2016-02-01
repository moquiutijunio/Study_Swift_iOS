//
//  RemoveViewController.swift
//  MealApp
//
//  Created by Junio Moquiuti on 2/1/16.
//  Copyright © 2016 jera. All rights reserved.
//

import Foundation
import UIKit

class RemoveViewController{
    
    let controller: UIViewController
    
    init (controller: UIViewController) {
        self.controller = controller
    }
    
    
    func show(meal: Meal, handler: ((UIAlertAction) -> Void)){
        
        var message = "Happiness: \(meal.happiness)"
        
        for item in meal.itens {
            message += "\n * \(item.name) - \(item.calories)"
        }
        
        let details = UIAlertController(title: meal.name, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let remove = UIAlertAction(title: "remove", style: UIAlertActionStyle.Destructive, handler: handler)
        details.addAction(remove)
        
        let exitAlert = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        details.addAction(exitAlert)
        
        controller.presentViewController(details, animated: true, completion: nil)
    }
}