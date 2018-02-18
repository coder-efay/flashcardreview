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

    let currentUser = AuthUserService.manager.getCurrentUser()
    
    @IBAction func createCardButtonPressed(_ sender: UIButton) {
        print("createCardButtonPressed")
        
//        let ques = questionTextView.text!
//        let ans = answerTextView.text!

        // TODO: Save all fields as Card

    }
    
    
    
    @objc private func post() {
        if let ques = questionTextView.text, !ques.isEmpty {
            if let ans = answerTextView.text, !ans.isEmpty {
                DBService.manager.addCard(withQuestion: ques, answer: ans, correct: false)
                print("new card added")
                // TODO: Dismiss the view if save successful
                self.dismiss(animated: true, completion: nil)
            }
        } else { return }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
