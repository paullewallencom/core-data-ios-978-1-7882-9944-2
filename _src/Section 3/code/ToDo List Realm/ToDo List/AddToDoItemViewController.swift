//
//  AddToDoItemViewController.swift
//  ToDo List
//
//  Created by zappycode on 1/19/18.
//  Copyright © 2018 Nick Walter. All rights reserved.
//

import UIKit
import RealmSwift

class AddToDoItemViewController: UIViewController {
    
    
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        // Create a ToDo Item with the info from the textfiled and Switch
        /*
         if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
         
         let toDoItem = ToDoItem(entity: ToDoItem.entity(), insertInto: context)
         
         toDoItem.name = nameTextField.text
         toDoItem.important = importantSwitch.isOn
         
         // Save ToDo Item in Core Data
         
         (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
         
         // Kick back to main view controller
         
         navigationController?.popViewController(animated: true)
         
         }
         */
        
        let toDo = ToDoThang()
        
        if let name = nameTextField.text {
            toDo.name = name
            toDo.important = importantSwitch.isOn
            
            if let realm = try? Realm() {
                
                try! realm.write {
                    realm.add(toDo)
                }
                
                navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
}
