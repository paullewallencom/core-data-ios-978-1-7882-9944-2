//
//  ViewController.swift
//  Core Data Fun
//
//  Created by zappycode on 1/19/18.
//  Copyright © 2018 Nick Walter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
//            let appleStock = Stock(entity: Stock.entity(), insertInto: context)
//            appleStock.marketCap = 40.0
//            appleStock.price = 123.50
//            appleStock.symbol = "APL"
//            
//            let teslaStock = Stock(entity: Stock.entity(), insertInto: context)
//            teslaStock.marketCap = 10.0
//            teslaStock.price = 40.60
//            teslaStock.symbol = "TSL"
//            
//            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            if let results = try? context.fetch(Stock.fetchRequest()) as? [Stock] {
                
                if let stocks = results {
                    
                    for stock in stocks {
                        print(stock.symbol)
                        print(stock.price)
                    }
                }
            }
        }
        
        
    }
    
    
    
}

