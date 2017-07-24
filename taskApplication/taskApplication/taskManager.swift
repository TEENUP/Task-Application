//
//  taskManager.swift
//  taskApplication
//
//  Created by Puneet on 24/07/17.
//  Copyright © 2017 PuneetGupta. All rights reserved.
//

import UIKit


var taskMgr: taskManager = taskManager()

struct task {
    var name = "Name"
    var desc = "Description"
}

class taskManager: NSObject {

    var tasks = [task]()
    
    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
    }
}
