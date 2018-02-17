//
//  CategoriesTableViewController.swift
//  FlashcardReview
//
//  Created by C4Q on 2/14/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    @IBAction func newCategoryBarButtonPressed(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
//    var categories = [Category]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    var categories = ["ABC", "CDE", "FGH", "IJK", "LMN", "OPQ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        // TODO
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categories[indexPath.row]
//        cell.textLabel?.text = category.categoryName
        cell.textLabel?.text = category
        return cell
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Create A New Category", message: "", preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (action) in
            let textField = alertController.textFields![0]
            
            // TODO: Take new category name and add to the Categories array
            if let newCategory = textField.text, textField.text != "" {
                DBService.manager.addCategory(withCategory: newCategory)
                print("New Category:", textField.text!)
            } else {
                return
            }
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in }
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Enter New Category Name"
            textField.autocorrectionType = .default
            textField.keyboardType = .default
            textField.clearButtonMode = .whileEditing
        }
        alertController.addAction(submitAction)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
}
