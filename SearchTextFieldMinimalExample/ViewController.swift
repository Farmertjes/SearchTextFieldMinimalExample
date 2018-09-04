//
//  ViewController.swift
//  SearchTextFieldMinimalExample
//
//  Created by Michiel Boertjes on 04/09/2018.
//  Copyright © 2018 Michiel Boertjes. All rights reserved.
//

import UIKit
import SearchTextField

class ViewController: UIViewController {

    @IBOutlet weak var exampleSearchTextField: SearchTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSimpleSearchTextField()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // 1 - Configure a simple search text view
    fileprivate func configureSimpleSearchTextField() {
        // Start visible even without user's interaction as soon as created - Default: false
//        exampleSearchTextField.startVisibleWithoutInteraction = true
        
        // Set data source
        let suggestions = ["no i am not", "hell yeah", "maybe, not sure yet", "do you even lift", "no hold on, I think I got it"];
        exampleSearchTextField.filterStrings(suggestions)
        
        exampleSearchTextField.itemSelectionHandler = { filteredResults, itemPosition in
            // Just in case you need the item position
            let item = filteredResults[itemPosition]
            print("Item at position \(itemPosition): \(item.title)")
            
            // Do whatever you want with the picked item
            self.exampleSearchTextField.text = item.title
        }
    }
    
    // Hide keyboard when touching the screen
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

