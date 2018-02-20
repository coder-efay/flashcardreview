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
    public func editCard(withPostID postID: String, newCorrect: Bool) {
        let ref = cardsRef.child(postID)
        ref.updateChildValues(["correct": newCorrect])
    }
}
