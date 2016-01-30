//
//  Meal.swift
//  MealApp
//
//  Created by Junio Moquiuti on 1/28/16.
//  Copyright © 2016 jera. All rights reserved.
//

import Foundation

class Meal {
    var name: String
    var happiness: Int
    var itens = Array<Item>()
    
    init(name: String, happiness: Int){
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double{
        var total = 0.0
        for item in itens{
            total += item.calories
        }
        return total
    }
    
}