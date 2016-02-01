//
//  Alert.swift
//  MealApp
//
//  Created by Junio Moquiuti on 2/1/16.
//  Copyright © 2016 jera. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    let controller: UIViewController
    
    init (controller: UIViewController) {
        self.controller = controller
    }
    
    func show (message: String = "Unexpected error, but the item was added.") {
        let alertMensange = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let exitAlert = UIAlertAction(title: "Exit", style: UIAlertActionStyle.Cancel, handler: nil)
        alertMensange.addAction(exitAlert)
        controller.presentViewController(alertMensange, animated: true, completion: nil)
    }
    
}
