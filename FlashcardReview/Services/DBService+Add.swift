//
//  DBService+Add.swift
//  FlashcardReview
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DBService {
    
    /// CREATE A NEW USER
    public func addUser(user: User) {
        let ref = usersRef.child(user.userID)
        ref.setValue(["email": user.email,
                      "userID": user.userID])
    }
    
    /// CREATE A NEW CATEGORY
    public func addCategory(withCategory category: String) {
        let ref = categoriesRef.childByAutoId()
        let category = Category(categoryName: category)
        ref.setValue(["category": category.categoryName])
    }
    
    /// CREATE A NEW CARD
    public func addCard(withQuestion question: String, answer: String, correct: Bool, category: String, userID: String) {
        let ref = cardsRef.childByAutoId()
        let card = Card(question: question, answer: answer, correct: correct, category: category, userID: ref.key)
        
        ref.setValue(["question": card.question,
                      "answer": card.answer,
                      "correct": card.correct,
                      "category": card.category,
                      "userID": card.userID])
    }
    
}
