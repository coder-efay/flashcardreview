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
    public func addUser(user: User) {
        let ref = usersRef.child(user.userID)
        
        ref.setValue(["email": user.email,
                      "userID": user.userID])
    }
    
    public func addCard(card: Card) {
        
        let ref = cardsRef.child(card.question)
        
        ref.setValue(["question": card.question,
                      "answer": card.answer,
                      "correct": card.correct,
                      "category": card.category])
    }
}
