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
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        let email = emailTextField.text!
        let pass = passwordTextfield.text!
        
        // Verify login credentials
        AuthUserService.manager.loginToAccount(with: email, and: pass){(user, error) in
            if let error = error {
                //TO DO: Handle errors
                // Create Alert
                self.showAlert(title: "\(error.localizedDescription)", message: "")
                print(error)
                return
            }
            if let user = user {
                // Navigate to next screen: Categories
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let presentedVC = storyboard.instantiateViewController(withIdentifier: "CategoriesTableViewController") as! CategoriesTableViewController
                let navController = UINavigationController(rootViewController: presentedVC)
                self.present(navController, animated: true, completion: nil)
                print("\(user) has logged in")
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
