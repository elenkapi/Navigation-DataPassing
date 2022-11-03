//
//  RegistrationVC.swift
//  Elene_Kapanadze_14
//
//  Created by Ellen_Kapii on 10.07.22.
//

import UIKit

class RegistrationVC: UIViewController {
    
    // Text fields
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmedPassword: UITextField!
    
    // Data passer closures
    var enteredUsername: ((String) -> ())?
    var enteredEmail: ((String) -> ())?
    var enteredPassword: ((String) -> ())?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    func areFilled() -> Bool {
        if username.hasText && email.hasText && password.hasText && confirmedPassword.hasText {
            return true
        }
        return false
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(action)
        self.navigationController?.present(alertController, animated: true)
    }
    
    func passwordValidation(_ initial: String, _ confirmed: String) {
        if initial != confirmed {
            showAlert(title: "Oops!", message: "Passwords Don't Match")
        }
    }
    
    func containsUppercased() -> Bool{
        var uppercaseCount = 0
        password.text?.forEach({ char in
            if char.isUppercase {
                uppercaseCount += 1
            }
        })
        if uppercaseCount >= 1 {
            return true
        }
        return false
    }
    
    func containsNumber() -> Bool {
        var numberCount = 0
        password.text?.forEach({ char in
            if char.isNumber {
                numberCount += 1
            }
        })
        if numberCount >= 1 {
            return true
        }
        return false
    }
    
    func checkPasswordSecurity() {
        if password.text!.count > 8 && containsUppercased() && containsNumber() {
            return
        }
        showAlert(title: "Oops!", message: "This password is not secure")
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if areFilled() {
            enteredUsername?(username.text!)
            enteredEmail?(email.text!)
            enteredPassword?(password.text!)
            checkPasswordSecurity()
            passwordValidation(password.text!, confirmedPassword.text!)
            navigationController?.popViewController(animated: true)
        } else {
            showAlert(title: "Oops!", message: "Please Fill in All Fields")
        }
    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}


