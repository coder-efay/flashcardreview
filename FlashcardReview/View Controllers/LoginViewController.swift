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
    
    private var user: AppUser?
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        let email = emailTextField.text!
        let pass = passwordTextfield.text!
        
        // Verify login credentials
        AuthUserService.manager.delegate = self
        AuthUserService.manager.loginToAccount(withEmail: email, andPassword: pass)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    public static func storyboardInstance() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let presentedVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        return presentedVC
    }
}


extension LoginViewController: AuthUserServiceDelegate {
    func didFailLogin(_ authUserService: AuthUserService, error: Error) {
        self.showAlert(title: "\(error.localizedDescription)", message: "")
//        print("Login failed")
    }
    
    func didLogin(_ authUserService: AuthUserService, userProfile: AppUser) {
        // Navigate to next screen: Categories
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let presentedVC = storyboard.instantiateViewController(withIdentifier: "CategoriesTableViewController") as! CategoriesTableViewController
        let navController = UINavigationController(rootViewController: presentedVC)
        present(navController, animated: true, completion: nil)
//        print("User has logged in")
    }
    
}

