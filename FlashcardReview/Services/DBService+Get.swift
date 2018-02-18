//
//  DBService+Get.swift
//  FlashcardReview
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import FirebaseDatabase

extension DBService {
    
    public func getCurrentUsersCategories(fromUserID uid: String, completion: @escaping (_ categories: [Category]) -> Void) {
        getAllCategories { (categories) in
            let userCategories = categories.filter{$0.userID == uid}
            completion(userCategories)
        }
    }
    
    public func getAllCategories(completion: @escaping (_ categories: [Category]) -> Void) {
        categoriesRef.observe(.value) { (dataSnapshot) in
            var categories: [Category] = []
            guard let categorySnapshots = dataSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for categorySnapshot in categorySnapshots {
                guard let categoryDict = categorySnapshot.value as? [String: Any] else { return }
                guard
                    let categoryName = categoryDict["category"] as? String,
                    let userID = categoryDict["userID"] as? String
                    else {
                        print("couldn't get categories")
                        return
                }
                let category = Category(categoryName: categoryName, userID: userID)
                categories.append(category)
            }
            completion(categories)
        }
    }
    
    
    public func getCardsFromCategory(fromUserID uid: String, category: String, completion: @escaping (_ cards: [Card]) -> Void) {
        getAllCards { (cards) in
            let cardsFromCat = cards.filter{$0.userID == uid}.filter{$0.category == category}
            completion(cardsFromCat)
        }
    }
    
    
    
    public func getCategoriesFromCards(fromUserID uid: String, category: String, completion: @escaping (_ cards: [Card]) -> Void) {
        getCurrentUsersCards(fromUserID: uid) { (cards) in
            let userCategories = cards.filter{$0.category == category}
            completion(userCategories)
        }
    }
    
    public func getCurrentUsersCards(fromUserID uid: String, completion: @escaping (_ cards: [Card]) -> Void) {
        getAllCards { (cards) in
            let userCards = cards.filter{$0.userID == uid}
            completion(userCards)
        }
    }
    
    public func getAllCards(completion: @escaping (_ cards: [Card]) -> Void) {
        cardsRef.observe(.value) { (dataSnapshot) in
            var cards: [Card] = []
            guard let cardSnapshots = dataSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for cardSnapshot in cardSnapshots {
                guard let cardDict = cardSnapshot.value as? [String: Any] else { return }
                guard
                    let question = cardDict["question"] as? String,
                    let answer = cardDict["answer"] as? String,
                    let correct = cardDict["correct"] as? Bool,
                    let category = cardDict["category"] as? String,
                    let userID = cardDict["userID"] as? String
                    else {
                        print("Could not get card")
                        return
                }
                let card = Card(question: question, answer: answer, correct: correct, category: category, userID: userID)
                cards.append(card)
            }
            completion(cards)
        }
    }
        
    
    
    public func getUserProfile(withUID uid: String, completion: @escaping (_ user: AppUser) -> Void) {
        let ref = usersRef.child(uid)
        ref.observe(.value) { (dataSnapshot) in
            guard let email = dataSnapshot.childSnapshot(forPath: "email").value as? String else { return }
            guard let username = dataSnapshot.childSnapshot(forPath: "username").value as? String else { return }
            let currentUser = AppUser(email: email, userID: uid, displayName: username)
            completion(currentUser)
        }
    }
    
    
}
