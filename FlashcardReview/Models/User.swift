//
//  User.swift
//  FlashcardReview
//
//  Created by C4Q on 2/14/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

class User: NSObject {
    let email: String
    let userID: String
    
    init(email: String, userID: String) {
        self.email = email
        self.userID = userID
    }
}
