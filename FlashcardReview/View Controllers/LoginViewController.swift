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
    
    @IBAction func tapOutsideTextfield(_ sender: UITapGestureRecognizer) {
        emailTextField.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
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
    }
    
    func didLogin(_ authUserService: AuthUserService, userProfile: AppUser) {
        // Navigate to next screen: Categories
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myCategoriesVC = storyboard.instantiateViewController(withIdentifier: "CategoriesTableViewController") as! CategoriesTableViewController
        let myNavController = UINavigationController(rootViewController: myCategoriesVC)
        
        let allQuestionsVC = storyboard.instantiateViewController(withIdentifier: "AllQuestionsTVC") as! AllDatabaseQuestionsTableViewController
        let myNavCon2 = UINavigationController(rootViewController: allQuestionsVC)
        
        let tabBarCon = UITabBarController()
        tabBarCon.viewControllers = [myNavController, myNavCon2]
        present(tabBarCon, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}
