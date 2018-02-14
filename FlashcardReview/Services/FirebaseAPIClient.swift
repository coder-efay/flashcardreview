//
//  FirebaseAPIClient.swift
//  FlashcardReview
//
//  Created by C4Q on 2/12/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAPIClient {
    static let manager = FirebaseAPIClient()
    
    // Create account
    func createNewAccount(with email: String, and password: String, completion: @escaping (User?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    // Login to an account
    func loginToAccount(with email: String, and password: String, completion: @escaping (User?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
}
