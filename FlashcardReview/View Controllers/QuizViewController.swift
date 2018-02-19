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
    var currentIndex = 0
    var currentCard: Card?
    var questions: [Card] = [] {
        didSet {
            print("\(questions.count) cards for quiz")
        }
    }
    @IBOutlet weak var switchObject: UISwitch!
    
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
        print("card tapped")
        checkCardSide()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = category
        loadRandomCard()
        front.snp.makeConstraints { (make) in
            make.edges.equalTo(cardView.snp.edges)
        }
        switchObject.isOn = (currentCard?.correct)!
    }
    
    private func loadRandomCard() {
        self.cardView.addSubview(front)
        currentIndex = Int(arc4random_uniform(UInt32(self.questions.count)))
        print("randomIndex: \(currentIndex)")
        currentCard = questions[currentIndex]
        front.questionLabel.text = currentCard?.question
        view.addSubview(cardView)
    }
    
    private func loadNextCard() {
        self.cardView.addSubview(front)
        if currentIndex == questions.count - 1 {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
        print("currentIndex: \(currentIndex)")
        currentCard = questions[currentIndex]
        front.questionLabel.text = currentCard?.question
        view.addSubview(cardView)
    }
    
    private func checkCardSide() {
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
    
    @IBAction func nextCardButtonPressed(_ sender: UIButton) {
        print("Next Card button pressed")
        loadNextCard()
        showingFront = false
        checkCardSide()
        switchObject.isOn = (currentCard?.correct)!
    }
    
    @IBAction func randomCardButtonPressed(_ sender: UIButton) {
        print("Random Card button pressed")
        loadRandomCard()
        showingFront = false
        checkCardSide()
        switchObject.isOn = (currentCard?.correct)!
    }
    
    @IBAction func practiceSwitch(_ sender: UISwitch) {
        if sender.isOn {
            DBService.manager.editCard(withPostID: (currentCard?.postID)!, newCorrect: true)
        } else {
            DBService.manager.editCard(withPostID: (currentCard?.postID)!, newCorrect: false)
        }
    }
    
    
}
