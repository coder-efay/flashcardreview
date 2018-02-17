//
//  AuthUserService.swift
//  FlashcardReview
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

/// This API client is responsible for logging the user in and creating accounts in the Firebase database.

class AuthUserService: NSObject {
    private override init() {
        super.init()
        self.auth = Auth.auth()
    }
    
    // The singleton object associated with the AuthUserService API client.
    static let manager = AuthUserService()
    private var auth: Auth!
    
    
    // Create account
    func createNewAccount(with email: String, and password: String, completion: @escaping AuthResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    // Login to an account
    func loginToAccount(with email: String, and password: String, completion: @escaping AuthResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    

    
    
    
    // Signs the current user out of the app and Firebase.
    public func signOut() {
        do {
            try auth.signOut()
        } catch {
            print(error)
        }
    }
}

