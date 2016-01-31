//
//  Task.swift
//  ListadeTarefaApp
//
//  Created by Junio Moquiuti on 1/29/16.
//  Copyright © 2016 Jera. All rights reserved.
//

import Foundation

class Task{
    var nameList: String
    var nameTask: String
    var status: String
    
    init(nameList: String, nameTask: String, status: String){
        self.nameList = nameList
        self.nameTask = nameTask
        self.status = status
    }
    
}
