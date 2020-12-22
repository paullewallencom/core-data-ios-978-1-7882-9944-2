//
//  ViewController.swift
//  Realm Fun
//
//  Created by zappycode on 1/19/18.
//  Copyright © 2018 Nick Walter. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        let person = Person()
        person.name = "Nick"
        person.birthdate = Date()
        
        let dog = Dog()
        dog.name = "Fido"
        dog.owner = person
 
 */
        if let realm = try? Realm() {
            /*
            try! realm.write {
                realm.add(dog)
                realm.add(person)
            }
 */
            
            let dogs = realm.objects(Dog.self)
            
            for dog in dogs {
                print(dog.name)
                print(dog.owner?.birthdate)
            }
        }

        
        
    }


}

// Dog model
class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var owner: Person? // Properties can be optional
}

// Person model
class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var birthdate = Date(timeIntervalSince1970: 1)
    let dogs = List<Dog>()
}

