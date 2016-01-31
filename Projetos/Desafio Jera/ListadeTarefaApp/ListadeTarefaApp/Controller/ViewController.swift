//
//  ViewController.swift
//  ListadeTarefaApp
//
//  Created by Junio Moquiuti on 1/29/16.
//  Copyright © 2016 Jera. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var NameListField: UITextField!
    
    @IBAction func AddButton(sender: AnyObject) {
        
        if NameListField == nil {
            return
        }
        
        let name = NameListField!.text
    
        let list = List(name: <#T##String#>)
        
        if let navigation = navigationController{
            navigation.popViewControllerAnimated(true)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

