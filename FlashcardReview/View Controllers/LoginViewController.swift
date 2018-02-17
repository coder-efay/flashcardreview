//
//  LoginViewController.swift
//  FlashcardReview
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    private var user: User?
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        let email = emailTextField.text!
        let pass = passwordTextfield.text!
        
        // Verify login credentials
        AuthUserService.manager.delegate = self
        AuthUserService.manager.loginToAccount(withEmail: email, andPassword: pass)
//            if let error = error {
//                //TO DO: Handle errors
//                // Create Alert
//                print(error)
//                return
//            }
//            if let user = user {
////            if let user = AuthUserService.manager.getCurrentUser() {
//
//                // Navigate to next screen: Categories
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let presentedVC = storyboard.instantiateViewController(withIdentifier: "CategoriesTableViewController") as! CategoriesTableViewController
//                let navController = UINavigationController(rootViewController: presentedVC)
//                self.present(navController, animated: true, completion: nil)
//                print("\(user.displayName) has logged in")
//            }
//        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if there is already a logged in user
//        if let user = user {
//            print("user email: \(user.email), user ID: \(user.userID)")
//        } else {
//            print("no current user")
//        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

}


extension LoginViewController: AuthUserServiceDelegate {
    func didFailLogin(_ authUserService: AuthUserService, error: Error) {
        self.showAlert(title: "\(error.localizedDescription)", message: "")
//        print("Login failed")
    }
    
    func didLogin(_ authUserService: AuthUserService, userProfile: User) {
        // Navigate to next screen: Categories
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let presentedVC = storyboard.instantiateViewController(withIdentifier: "CategoriesTableViewController") as! CategoriesTableViewController
        let navController = UINavigationController(rootViewController: presentedVC)
        present(navController, animated: true, completion: nil)
//        print("User has logged in")
    }
    
}
