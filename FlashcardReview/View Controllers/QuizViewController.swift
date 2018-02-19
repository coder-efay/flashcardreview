//
//  QuizViewController.swift
//  FlashcardReview
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class QuizViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    var front = QuizCardViewFront()
    var back = QuizCardViewBack()
    var showingFront = true
    var category: String?
    var questions: [Card] = [] {
        didSet {
            print("\(questions.count) cards for quiz")
        }
    }
    var currentCard: Card?
    
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
        print("card tapped")
        
        if (showingFront) {
            UIView.transition(from: front, to: back, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: { (results) in
                self.cardView.addSubview(self.back)
                self.back.snp.makeConstraints{ (make) in
                    make.edges.equalTo(self.cardView.snp.edges)
                }
                self.back.answerLabel.text = self.currentCard?.answer
            })
            showingFront = false
        } else {
            UIView.transition(from: back, to: front, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: { (results) in
                self.cardView.addSubview(self.front)
                self.front.snp.makeConstraints{ (make) in
                    make.edges.equalTo(self.cardView.snp.edges)
                }
                self.front.questionLabel.text = self.currentCard?.question
            })
            showingFront = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: randomize cards
        currentCard = questions[0]
        
        self.cardView.addSubview(front)
        front.questionLabel.text = currentCard?.question
        front.snp.makeConstraints { (make) in
            make.edges.equalTo(cardView.snp.edges)
        }
        view.addSubview(cardView)
    }

    
    @IBAction func newCardButtonPressed(_ sender: UIButton) {
        // TODO: Show next Question
        print("Next Card button pressed")
    }
    

   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
