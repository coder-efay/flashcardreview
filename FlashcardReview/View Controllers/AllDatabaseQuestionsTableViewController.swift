//
//  AllDatabaseQuestionsTableViewController.swift
//  FlashcardReview
//
//  Created by C4Q on 2/21/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class AllDatabaseQuestionsTableViewController: UITableViewController {

    @IBOutlet weak var quizBarButton: UIBarButtonItem!
    
    
    var allQuestionsInDatabase: [Card] = [] {
        didSet {
            tableView.reloadData()
            if allQuestionsInDatabase.count >= 1 {
                quizBarButton.isEnabled = true
            } else {
                quizBarButton.isEnabled = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red:1.00, green:0.53, blue:0.58, alpha:1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        DBService.manager.getAllCards { (cards) in
            self.allQuestionsInDatabase = cards
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuestionsInDatabase.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllQCardCell", for: indexPath)
        let card = allQuestionsInDatabase[indexPath.row]
        cell.textLabel?.text = card.question
        cell.detailTextLabel?.text = card.answer
        return cell
    }

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            switch id {
            case "AllCardsQuiz":
                guard let destination = segue.destination as? AllQuestionsQuizViewController else { return }
                destination.questions = allQuestionsInDatabase
            default:
                break
            }
        }
    }
}

