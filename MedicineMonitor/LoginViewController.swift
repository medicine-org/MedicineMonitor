//
//  LoginViewController.swift
//  MedicineMonitor
//
//  Created by Anish Adhikari on 4/4/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var isBothTextFieldEditing: Bool = false
    var loginButtonsHighlighted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameField.borderStyle = UITextBorderStyle.roundedRect
        passwordField.borderStyle = UITextBorderStyle.roundedRect
        
        loginButton.layer.borderWidth = 0.5
        loginButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5).cgColor
        
        userNameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if userNameField.text != "" && passwordField.text != "" {
            isBothTextFieldEditing = true
        } else {
            isBothTextFieldEditing = false
        }
        
        if isBothTextFieldEditing && !loginButtonsHighlighted {
            loginButton.layer.backgroundColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9).cgColor
            loginButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            loginButtonsHighlighted = true
        }
        
        if !isBothTextFieldEditing && loginButtonsHighlighted {
            loginButton.layer.backgroundColor = nil
            loginButton.setTitleColor(UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9), for: .normal)
            loginButtonsHighlighted = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogIn(_ sender: Any) {
        MBProgressHUD.showAdded(to: view, animated: true)
        
        let username = userNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (username?.isEmpty)! {
            presentAlert(msg: "Phone Required", description: "Please enter your username and password")
        } else if (password?.isEmpty)! {
            presentAlert(msg: "Password Required", description: "Please enter your username and password")
        }
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print("User succesfully logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                self.userNameField.text = ""
                self.passwordField.text = ""
                let errorString =  error?.localizedDescription
                self.presentAlert(msg: "Login Failed", description: errorString!)
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = userNameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success == true {
                print("User successfully registered.")
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    
    func presentAlert(msg: String, description: String) {
        let alertController = UIAlertController(title: msg, message: description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
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
