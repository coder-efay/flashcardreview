//
//  DBService.swift
//  FlashcardReview
//
//  Created by C4Q on 2/14/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBService: NSObject {
    private override init() {
        self.rootRef = Database.database().reference()
        self.usersRef = self.rootRef.child("users")
        self.cardsRef = self.rootRef.child("cards")

        super.init()
    }
    
    /// The singleton object for the DatabaseService API client.
    static let manager = DBService()
    
//    public weak var delegate: DatabaseServiceDelegate?
    
    var rootRef: DatabaseReference!
    var usersRef: DatabaseReference!
    var cardsRef: DatabaseReference!
}



