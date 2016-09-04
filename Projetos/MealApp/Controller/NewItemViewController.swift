//
//  NewItemViewController.swift
//  MealApp
//
//  Created by Junio Moquiuti on 1/30/16.
//  Copyright © 2016 jera. All rights reserved.
//

import UIKit

protocol addNewItemDelegate{
    func addItem(item: Item)
}

class NewItemViewController: UIViewController, UITableViewDelegate{

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var caloriesField: UITextField!
    var delegate: addNewItemDelegate?
    
    init(delegate: addNewItemDelegate){
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func addNewItem() {
        if nameField == nil || caloriesField == nil {
            return
        }
        
        let name = nameField.text!
        let calories = Double(caloriesField.text!)
        
        
        let item = Item(name: name, calories: calories!)
        
        print("New Item: \(item.name) \(item.calories)")
        
        if delegate == nil{
            return
        }

        delegate!.addItem(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }

}
