//
//  Meal.swift
//  MealApp
//
//  Created by Junio Moquiuti on 1/28/16.
//  Copyright © 2016 jera. All rights reserved.
//

import Foundation

class Meal: NSObject, NSCoding {
    var name: String
    var happiness: Int
    var itens = Array<Item>()
    
    init(name: String, happiness: Int){
        self.name = name
        self.happiness = happiness
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.happiness = aDecoder.decodeObjectForKey("happiness") as! Int
        self.itens = aDecoder.decodeObjectForKey("itens") as! Array
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(happiness, forKey: "happiness")
        aCoder.encodeObject(itens, forKey: "itens")
    }
    
    func allCalories() -> Double{
        var total = 0.0
        for item in itens{
            total += item.calories
        }
        return total
    }
    
}