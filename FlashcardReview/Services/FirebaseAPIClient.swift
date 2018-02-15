//
//  FirebaseAPIClient.swift
//  FlashcardReview
//
//  Created by C4Q on 2/12/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class FirebaseAPIClient {
    static let manager = FirebaseAPIClient()
    private init() {}
    

    // Create account
    func createNewAccount(with email: String, and password: String, completion: @escaping AuthResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    // Login to an account
    func loginToAccount(with email: String, and password: String, completion: @escaping AuthResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
//    // Load Categories
//    func loadCategories(completionHandler: @escaping ([Category]?, Error?) -> Void) {
//        let ref = Database.database().reference().child("categories")
//        ref.observe(.value){(snapShot) in
//            guard let snapShots = snapShot.children.allObjects as? [DataSnapshot] else { return }
//            var allCategories = [Category]()
//            for snap in snapShots {
//                let categoryName = snap.key
//
//                allCategories.append(categoryName)
//            }
//        }
//        completionHandler(allTasks, nil)
//    }
}

