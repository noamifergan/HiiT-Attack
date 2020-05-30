//
//  SetupViewController.swift
//  HiiT Attack
//
//  Created by Noam Efergan on 14/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
        
        
        override func viewDidLayoutSubviews() {
            super .viewDidLayoutSubviews()
            backView.applyBlueGradiant()
            submitButton.applyGreenGradiant()
        }
        
        // MARK: - variables
        let backView = UIView()
        let emailTextField = UITextField()
        let passwordTextField = UITextField()
        let nameTextField = UITextField()
        let submitButton = UIButton()
        let registerLable:UILabel = UILabel()
        
        
        
        
        
        
        
        // MARK: - view did load
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
            
            addBackView()
            addRegisterLable()
            addEmailTextfield()
            addPasswordTextField()
            addNameTextField()
            addSubmitButton()
            emailTextField.delegate = self
            passwordTextField.delegate = self
            nameTextField.delegate = self
          
        }
        
        
        
        //MARK: -  all add functions
        
        func addBackView(){
            backView.translatesAutoresizingMaskIntoConstraints = false
            backView.layer.cornerRadius = 26
            backView.clipsToBounds = true
            view.addSubview(backView)
            let margins = view.layoutMarginsGuide
            backView.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
            backView.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
            backView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.85).isActive = true
            backView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.8).isActive = true
        }
        
        func addRegisterLable(){
            registerLable.translatesAutoresizingMaskIntoConstraints = false
            registerLable.textAlignment = .center
            registerLable.text = "Register"
            registerLable.textColor = .white
            registerLable.font = .systemFont(ofSize: 32, weight: .light)
            backView.addSubview(registerLable)
            let margins = backView.layoutMarginsGuide
            registerLable.topAnchor.constraint(equalToSystemSpacingBelow: margins.topAnchor, multiplier: 1).isActive = true
            registerLable.centerXAnchor.constraint(equalToSystemSpacingAfter: margins.centerXAnchor, multiplier: 1).isActive = true
            registerLable.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.7).isActive = true
            registerLable.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.1).isActive = true
            
        }
        
        func addEmailTextfield(){
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            emailTextField.placeholder = "Email"
            emailTextField.addDoneButtonOnKeyboard()
            emailTextField.textAlignment = .center
            emailTextField.backgroundColor = .white
            emailTextField.layer.cornerRadius = 13
            emailTextField.clipsToBounds = true
            emailTextField.keyboardType = .emailAddress
            emailTextField.textContentType = .emailAddress
            backView.addSubview(emailTextField)
            let margins = backView.layoutMarginsGuide
            NSLayoutConstraint.activate([
                emailTextField.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: -160),
                emailTextField.centerXAnchor.constraint(equalToSystemSpacingAfter: margins.centerXAnchor, multiplier: 1),
                emailTextField.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.9),
                emailTextField.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.07)
            ])

            
        }
        
        func addPasswordTextField(){
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.placeholder = "Password"
            passwordTextField.textAlignment = .center
            passwordTextField.addDoneButtonOnKeyboard()
            passwordTextField.backgroundColor = .white
            passwordTextField.layer.cornerRadius = 13
            passwordTextField.clipsToBounds = true
            passwordTextField.textContentType = .newPassword
            passwordTextField.isSecureTextEntry = true
            backView.addSubview(passwordTextField)
            let margins = backView.layoutMarginsGuide
            NSLayoutConstraint.activate([
            passwordTextField.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: -80),
            passwordTextField.centerXAnchor.constraint(equalToSystemSpacingAfter: margins.centerXAnchor, multiplier: 1),
            passwordTextField.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.9),
            passwordTextField.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.07)
            ])
        }
        
        func addNameTextField(){
            nameTextField.translatesAutoresizingMaskIntoConstraints = false
            nameTextField.placeholder = "How should we call you?"
            nameTextField.textAlignment = .center
            nameTextField.backgroundColor = .white
            nameTextField.layer.cornerRadius = 13
            nameTextField.addDoneButtonOnKeyboard()
            nameTextField.clipsToBounds = true
            backView.addSubview(nameTextField)
            let margins = backView.layoutMarginsGuide
            NSLayoutConstraint.activate([
                nameTextField.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: 1),
                nameTextField.centerXAnchor.constraint(equalToSystemSpacingAfter: margins.centerXAnchor, multiplier: 1),
                nameTextField.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.9),
                nameTextField.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.07)
            ])
        }
        
        func addSubmitButton(){
            submitButton.translatesAutoresizingMaskIntoConstraints = false
            submitButton.setTitle("submit", for: .normal)
            submitButton.titleLabel?.font = .systemFont(ofSize: 32, weight: .ultraLight)
            submitButton.layer.cornerRadius = 24
            submitButton.clipsToBounds = true
            submitButton.addTarget(self, action: #selector(submitWasPressed), for: .touchUpInside)
            backView.addSubview(submitButton)
            let margins = backView.layoutMarginsGuide
            NSLayoutConstraint.activate([
                submitButton.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: 160),
                submitButton.centerXAnchor.constraint(equalToSystemSpacingAfter: margins.centerXAnchor, multiplier: 1),
                submitButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.9),
                submitButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.17)
            ])
        }
        
        // MARK: - submit button was pressed
        @objc func submitWasPressed(sender:UIButton!){
        
            let email = emailTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            let name = nameTextField.text ?? ""
            if email != "" {
                if password.count >= 6 {
                    if name != "" {

                            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            if error != nil {
                                let alert = UIAlertController(title: "error", message: "Invalid email or password, or email is already used", preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                            }else{
                                guard let uid = authResult?.user.uid else {return}
                                let userUID = ConstantsForApp.ref.child(uid)
                                userUID.updateChildValues(["name":name, "email":email])
                                self.navigationController?.pushViewController(ConstantsForApp.setupvc, animated: true)
                                }
                            
                        }

                    }
                    else {
                        let alert = UIAlertController(title: "Please enter a name", message: "It can be your name, a nickname,or anything you want us to call you!", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
            }
                else {
                    let alert = UIAlertController(title: "Invalid password", message: "Password has to be at lest 6 charecters long", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else {
                let alert = UIAlertController(title: "Invalid email", message: "Please enter a valid email address", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }


