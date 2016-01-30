//
//  Item.swift
//  MealApp
//
//  Created by Junio Moquiuti on 1/28/16.
//  Copyright © 2016 jera. All rights reserved.
//

import Foundation

class Item : Equatable{
    var name: String
    var calories: Double
    init(name: String, calories: Double){
        self.name = name
        self.calories = calories
    }
}
func ==(first: Item, secund: Item) -> Bool{
    return first.name == secund.name && first.calories == secund.calories
}