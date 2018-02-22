//
//  AllQuestionsQuizViewController.swift
//  FlashcardReview
//
//  Created by C4Q on 2/21/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class AllQuestionsQuizViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var randomCardButton: UIButton!
    @IBOutlet weak var nextCardButton: UIButton!
    
    var front = QuizCardViewFront()
    var back = QuizCardViewBack()
    var showingFront = true
    var currentIndex = 0
    var currentCard: Card?
    var questions: [Card] = [] {
        didSet {
            print("\(questions.count) cards for quiz")
        }
    }

    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
        print("card tapped")
        checkCardSide()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All Flashcards"
        randomCardButton.layer.borderWidth = 1
        randomCardButton.layer.borderColor = UIColor.black.cgColor
        nextCardButton.layer.borderWidth = 1
        nextCardButton.layer.borderColor = UIColor.white.cgColor
        cardView.layer.borderWidth = 1
        cardView.layer.cornerRadius = 15
        cardView.layer.masksToBounds = true
        loadRandomCard()
        front.snp.makeConstraints { (make) in
            make.edges.equalTo(cardView.snp.edges)
        }
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
        front.questionLabel.text = "Q: \(self.currentCard?.question ?? "")"
        view.addSubview(cardView)
    }
    
    private func checkCardSide() {
        if (showingFront) {
            UIView.transition(from: front, to: back, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: { (results) in
                self.cardView.addSubview(self.back)
                self.cardView.layer.borderWidth = 1
                self.cardView.layer.cornerRadius = 15
                self.cardView.layer.masksToBounds = true
                self.back.snp.makeConstraints{ (make) in
                    make.edges.equalTo(self.cardView.snp.edges)
                }
                self.back.answerLabel.text = "A: \(self.currentCard?.answer ?? "")"
            })
            showingFront = false
        } else {
            UIView.transition(from: back, to: front, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: { (results) in
                self.cardView.addSubview(self.front)
                self.cardView.layer.borderWidth = 1
                self.cardView.layer.cornerRadius = 15
                self.cardView.layer.masksToBounds = true
                self.front.snp.makeConstraints{ (make) in
                    make.edges.equalTo(self.cardView.snp.edges)
                }
                self.front.questionLabel.text = "Q: \(self.currentCard?.question ?? "")"
            })
            showingFront = true
        }
    }
    
    @IBAction func nextCardButtonPressed(_ sender: UIButton) {
        print("Next Card button pressed")
        loadNextCard()
        showingFront = false
        checkCardSide()
    }
    
    @IBAction func randomCardButtonPressed(_ sender: UIButton) {
        print("Random Card button pressed")
        loadRandomCard()
        showingFront = false
        checkCardSide()
    }

    
}

