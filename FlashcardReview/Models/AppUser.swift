//
//  User.swift
//  FlashcardReview
//
//  Created by C4Q on 2/14/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

class AppUser: NSObject {
    let email: String
    let userID: String
    var displayName: String
    init(email: String, userID: String, displayName: String) {
        self.email = email
        self.userID = userID
        self.displayName = displayName
    }
}
