//
//  CompleteToDoItemViewController.swift
//  ToDo List
//
//  Created by zappycode on 1/19/18.
//  Copyright © 2018 Nick Walter. All rights reserved.
//

import UIKit

class CompleteToDoItemViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var toDoItem : ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDoItem {
            
            if toDo.important {
                // Add the !
                if let name = toDo.name {
                    nameLabel.text = "❗️\(name)"
                }
            } else {
                nameLabel.text = toDo.name
            }
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        // Delete the ToDo
        
         if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDo = toDoItem {
                context.delete(toDo)
            }
        }
        
        // Move back to the VC
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
