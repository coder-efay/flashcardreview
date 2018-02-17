//
//  AuthUserServiceDelegate.swift
//  FlashcardReview
//
//  Created by C4Q on 2/17/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Firebase

@objc protocol AuthUserServiceDelegate: class {
    
    
    @objc optional func didLogin(_ authUserService: AuthUserService, userProfile: User)
    
    @objc optional func didFailLogin(_ authUserService: AuthUserService, error: Error)
    
    
}
