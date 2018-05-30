//
//  ChangePasswordViewController.swift
//  MedicineMonitor
//
//  Created by Anish Adhikari on 5/3/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldPasswordField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var changePasswordButton: UIButton!
    
    var isBothTextFieldEditing: Bool = false
    var loginButtonsHighlighted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        oldPasswordField.borderStyle = UITextBorderStyle.roundedRect
        newPasswordField.borderStyle = UITextBorderStyle.roundedRect
        
        changePasswordButton.layer.borderWidth = 0.5
        changePasswordButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5).cgColor
        
        oldPasswordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        newPasswordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if oldPasswordField.text != "" && newPasswordField.text != "" {
            isBothTextFieldEditing = true
        } else {
            isBothTextFieldEditing = false
        }
        
        if isBothTextFieldEditing && !loginButtonsHighlighted {
            changePasswordButton.layer.backgroundColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9).cgColor
            changePasswordButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            loginButtonsHighlighted = true
        }
        
        if !isBothTextFieldEditing && loginButtonsHighlighted {
            changePasswordButton.layer.backgroundColor = nil
            changePasswordButton.setTitleColor(UIColor(red: 0, green: 0.5, blue: 1, alpha: 0.9), for: .normal)
            loginButtonsHighlighted = false
        }
    }
    
    func presentAlert(msg: String, description: String) {
        let alertController = UIAlertController(title: msg, message: description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
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
