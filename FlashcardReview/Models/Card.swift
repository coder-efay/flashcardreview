//
//  Cards.swift
//  FlashcardReview
//
//  Created by C4Q on 2/14/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

struct Card {
    let question: String
    let answer: String
    let correct: Bool
    let category: String
}
