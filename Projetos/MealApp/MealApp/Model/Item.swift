//
//  Item.swift
//  MealApp
//
//  Created by Junio Moquiuti on 1/28/16.
//  Copyright © 2016 jera. All rights reserved.
//

import Foundation

class Item : NSObject, NSCoding {
    
    var name: String
    var calories: Double
    init(name: String, calories: Double){
        self.name = name
        self.calories = calories
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.calories = aDecoder.decodeDoubleForKey("calories")
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeDouble(calories, forKey: "calories")
    }
    
}
func ==(first: Item, secund: Item) -> Bool{
    return first.name == secund.name && first.calories == secund.calories
}