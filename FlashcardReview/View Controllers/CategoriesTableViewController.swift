//
//  CategoriesTableViewController.swift
//  FlashcardReview
//
//  Created by C4Q on 2/14/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CategoriesTableViewController: UITableViewController {
    
    @IBAction func newCategoryBarButtonPressed(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
    var categories: [Category] = [] {
        didSet {
            tableView.reloadData()
            print("current categories: \(categories)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = AuthUserService.manager.getCurrentUser()
        DBService.manager.getCurrentUsersCategories(fromUserID: (currentUser?.uid)!) { (userCategories) in
            self.categories = userCategories
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.categoryName
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

extension CategoriesTableViewController {
    
    // Navigate to next screen: Categories
    public static func storyboardInstance() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let presentedVC = storyboard.instantiateViewController(withIdentifier: "CategoriesTableViewController") as! CategoriesTableViewController
        let navController = UINavigationController(rootViewController: presentedVC)
        return navController
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            switch id {
            case "CategoryToCards":
                guard let destination = segue.destination as? QuestionsTableViewController else { return }
                let selectedCategory = categories[tableView.indexPathForSelectedRow!.row]
                destination.category = selectedCategory.categoryName
            default:
                break
            }
        }
    }
}
