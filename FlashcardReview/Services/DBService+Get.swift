//
//  DBService+Get.swift
//  FlashcardReview
//
//  Created by C4Q on 2/15/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import FirebaseDatabase

extension DBService {
    
    public func getAllCategories(fromUserID userID: String, completion: @escaping (_ categories: [Category]) -> Void) {
        categoriesRef.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let categoryName = value?["category"] as? String ?? ""
            let category = Category(categoryName: categoryName)
        })
        { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    public func getAllCards(completion: @escaping (_ cards: [Card]) -> Void) {
        cardsRef.observeSingleEvent(of: .value) { (dataSnapshot) in
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
        
    
    
    public func getUserProfile(withUID uid: String, completion: @escaping (_ user: User) -> Void) {
        let ref = usersRef.child(uid)
        ref.observe(.value) { (dataSnapshot) in
            guard let email = dataSnapshot.childSnapshot(forPath: "email").value as? String else { return }
            guard let username = dataSnapshot.childSnapshot(forPath: "username").value as? String else { return }
            let currentUser = User(email: email, userID: uid, displayName: username)
            completion(currentUser)
        }
    }
    
    
}
