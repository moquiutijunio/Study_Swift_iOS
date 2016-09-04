//
//  Dao.swift
//  MealApp
//
//  Created by Junio Moquiuti on 2/1/16.
//  Copyright © 2016 jera. All rights reserved.
//

import Foundation

class Dao {
    
    let mealsArchive: String
    let itensArchive: String
    
    init(){
        let userDisc = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let dir = userDisc[0] as String
        
        mealsArchive = "\(dir)/eggplant-brownie-meals"
        itensArchive = "\(dir)/eggplant-brownie-itens"
    }
    
    func saveMeals(meal: Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meal, toFile: mealsArchive)
    }
    
    func loadmeals() -> Array<Meal>{
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive){
            return loaded as! Array
        } else {
            return Array<Meal>()
        }
    }
    
    func saveItens(itens: Array<Item>) {
        NSKeyedArchiver.archiveRootObject(itens, toFile: itensArchive)
    }
    
    func loaditens() -> Array<Item>{
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(itensArchive){
            return loaded as! Array
        } else {
            return Array<Item>()
        }
    }
}