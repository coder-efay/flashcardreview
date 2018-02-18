//
//  QuizViewController.swift
//  FlashcardReview
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
//        var cardView: UIView!
    var front: UIView!
    var back: UIView!
    var showingFront = true
    
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
        
        print("card tapped")
        
        // TODO: Show Question
        if (showingFront) {
            UIView.transition(from: front, to: back, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            showingFront = false
        } else {
            // TODO: Flip to Show Answer
            UIView.transition(from: back, to: front, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            showingFront = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.backgroundColor = .red
        
        front = QuizCardViewFront()
        back = QuizCardViewBack()
        self.cardView.addSubview(front)
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
