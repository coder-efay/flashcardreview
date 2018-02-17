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
    weak public var delegate: AuthUserServiceDelegate?
    
    // Create account
    public func createNewAccount(with email: String, and password: String, completion: @escaping AuthResultCallback) {
        auth.createUser(withEmail: email, password: password, completion: completion)
    }
    
    // Login to an account
    public func loginToAccount(withEmail email: String, andPassword password: String) {
        auth.signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                self.delegate?.didFailLogin!(self, error: error)
//                print(error)
                return
            }
            if let user = user {
                DBService.manager.getUserProfile(withUID: user.uid, completion: { (userProfile) in
                    self.delegate?.didLogin!(self, userProfile: userProfile)
                    print("AuthUserService -- username: \(userProfile.displayName), email: \(userProfile.email), userID: \(userProfile.userID) has logged in")
                })
            }
        }
    }
    
    
    // Get current user
    //    public func getCurrentUser() -> User? {
    //        let user = Auth.auth().currentUser
    //        return user
    //    }
    
    //    public func getCurrentUser() -> User? {
    //        return auth.currentUser
    //    }
    
    
    // Signs the current user out of the app and Firebase.
    public func signOut() {
        do {
            try auth.signOut()
        } catch {
            print(error)
        }
    }


}

