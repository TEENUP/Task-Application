//
//  FirstViewController.swift
//  taskApplication
//
//  Created by Puneet on 24/07/17.
//  Copyright © 2017 PuneetGupta. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
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

    
    @IBOutlet weak var tblTasks: UITableView!
    
    @IBOutlet weak var txtTask: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    
    @IBAction func btnAddTask(_ sender: UIButton) {
        if(txtTask.text == ""){
            // Task Title is blank, do not add a record
        }
        else{
            //add record
            taskMgr.addTask(name: txtTask.text!, desc: txtDesc.text!)
            //dismiss keyboard and reset fields
            self.view.endEditing(true)
            txtTask.text = nil
            txtDesc.text = nil
            tblTasks.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskMgr.addTask(name: "rfrfrfr" , desc: "frfrfr")
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
        print("name::", taskMgr.tasks[indexPath.row].name)
        print("description::", taskMgr.tasks[indexPath.row].desc)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.delete){
            taskMgr.tasks.remove(at: indexPath.row)
            tblTasks.reloadData()
        }
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent){
        
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }



}

