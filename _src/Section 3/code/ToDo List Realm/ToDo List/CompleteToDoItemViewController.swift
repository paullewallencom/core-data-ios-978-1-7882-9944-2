//
//  CompleteToDoItemViewController.swift
//  ToDo List
//
//  Created by zappycode on 1/19/18.
//  Copyright © 2018 Nick Walter. All rights reserved.
//

import UIKit
import RealmSwift

class CompleteToDoItemViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var toDoItem : ToDoThang?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDoItem {
            
            nameLabel.text = toDo.nameWithImportance()
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        // Delete the ToDo
        /*
         if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDo = toDoItem {
                context.delete(toDo)
            }
        }
 */
        
        if let realm = try? Realm() {
            
            try! realm.write {
                realm.delete(toDoItem!)
            }
        }
        
        // Move back to the VC
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
