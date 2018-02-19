//
//  DBService+Edit.swift
//  FlashcardReview
//
//  Created by C4Q on 2/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DBService {
    public func editCard(withQuestion question: String, answer: String, correct: Bool, category: String) {
        
        let currentUser = AuthUserService.manager.getCurrentUser()
        let ref = cardsRef.childByAutoId()
        
        let card = Card(question: question, answer: answer, correct: correct, category: category, userID: (currentUser?.uid)!, postID: ref.key)
        
            ref.updateChildValues(["correct": correct])
                                        
        
    }

}
