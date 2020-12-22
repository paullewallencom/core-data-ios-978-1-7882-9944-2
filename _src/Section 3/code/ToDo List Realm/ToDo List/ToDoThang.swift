//
//  ToDoThang.swift
//  ToDo List
//
//  Created by zappycode on 1/19/18.
//  Copyright © 2018 Nick Walter. All rights reserved.
//

import RealmSwift

class ToDoThang: Object {
    @objc dynamic var name = ""
    @objc dynamic var important = false
    
    func nameWithImportance() -> String {
        if important {
            return "❗️\(name)"
        } else {
            return name
        }
    }
}
