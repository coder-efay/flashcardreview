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
        //TO-DO: Validate email and password
        let email = emailTextField.text!
        let pass = passwordTextfield.text!
        FirebaseAPIClient.manager.loginToAccount(with: email, and: pass){(user, error) in
            if let error = error {
                //TO DO: Handle errors
                print(error)
                return
            }
            if let user = user {
                //TO DO: Navigate to next screen
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
