//
//  SecondViewController.swift
//  taskApplication
//
//  Created by Puneet on 24/07/17.
//  Copyright © 2017 PuneetGupta. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var txtTask: UITextField!
    @IBOutlet weak var txtDesc: UITextField!
    
    @IBAction func btnAddTask(sender: UIButton){
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
        }
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent){
    
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

