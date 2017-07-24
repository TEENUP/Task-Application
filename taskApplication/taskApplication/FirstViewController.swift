//
//  FirstViewController.swift
//  taskApplication
//
//  Created by Puneet on 24/07/17.
//  Copyright © 2017 PuneetGupta. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tblTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblTasks.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskMgr.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Default Tasks")
        
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].desc
        print(taskMgr.tasks)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.delete){
            taskMgr.tasks.remove(at: indexPath.row)
            tblTasks.reloadData()
        }
    }


}

