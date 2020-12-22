//
//  ToDoItemTableViewController.swift
//  ToDo List
//
//  Created by zappycode on 1/19/18.
//  Copyright © 2018 Nick Walter. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoItemTableViewController: UITableViewController {

    //var toDoItems = [ToDoItem]()
    var toDoThangs : Results<ToDoThang>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDoItems()
    }
    
    func getToDoItems() {
        /*
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let results = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                if let toDoItems = results {
                    self.toDoItems = toDoItems
                    tableView.reloadData()
                }
            }
        }
 */
        
        if let realm = try? Realm() {
            toDoThangs = realm.objects(ToDoThang.self)
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoThangs!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let toDoItem = toDoThangs![indexPath.row]
        
        
            cell.textLabel?.text = toDoItem.nameWithImportance()
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let toDoItem = toDoThangs![indexPath.row]
        
        performSegue(withIdentifier: "completeToDoSegue", sender: toDoItem)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "completeToDoSegue" {
            if let toDoItem = sender as? ToDoThang {
                if let completeToDoItemVC = segue.destination as? CompleteToDoItemViewController {
                    completeToDoItemVC.toDoItem = toDoItem
                }
                
            }
        }
    }

}
