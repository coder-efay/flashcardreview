//
//  NewCardViewController.swift
//  FlashcardReview
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class NewCardViewController: UIViewController {
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var newCategoryTextField: UITextField!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    
    @IBAction func createCardButtonPressed(_ sender: UIButton) {
        print("createCardButtonPressed")
        
        // TODO: Save all fields as Card
        
        // TODO: Dismiss the view if save successful
        self.dismiss(animated: true, completion: nil)
    }
    
    // powered by array of existing Categories
    var categories = [Category]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension NewCardViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    
    
}
