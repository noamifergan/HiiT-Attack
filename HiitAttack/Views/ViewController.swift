//
//  ViewController.swift
//  HiiT Attack
//
//  Created by Noam Efergan on 13/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit


   
class ViewController: UIViewController, LoginButtonDelegate{
    
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        else{
            if let token = AccessToken.current,
                !token.isExpired {
                self.navigationController?.pushViewController(ConstantsForApp.setupvc, animated: false)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        loginView.applyBlueGradiant()
    }
    // MARK: -variables
    
    let loginView = UIView()
    let loginLable:UILabel = UILabel()
    let emailTextField:UITextField = UITextField()
    let passwordTextField:UITextField = UITextField()
    let loginButton: UIButton = UIButton()
    let registerButton:UIButton = UIButton()
    let FBButton = FBLoginButton()
    
    
    let socialMediaView:UIView = UIView()



   
    // MARK: - view did load
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       
//        print(realm.configuration.fileURL)
        
        FBButton.delegate = self
        addLoginBlock()
        addLoginLable()
        addEmailTextField()
        addPasswordTextField()
        addLoginButton()
        addSocailMediaButtons()
        addRegisterButton()
        addFaceBookLoginButton()
        
        if let token = AccessToken.current,
            !token.isExpired {
            self.navigationController?.pushViewController(ConstantsForApp.setupvc, animated: false)
        }
        if Auth.auth().currentUser != nil {
            self.navigationController?.pushViewController(ConstantsForApp.setupvc, animated: false)
        }
        
    }
    
    // MARK: - all add functions
    
    func addLoginBlock() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.layer.cornerRadius = 26
        loginView.clipsToBounds = true
        view.addSubview(loginView)
        let centerXAxis = NSLayoutConstraint(item: loginView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYAxis = NSLayoutConstraint(item: loginView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.65, constant: 1)
        let width = NSLayoutConstraint(item: loginView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.8, constant: 1)
        let hight = NSLayoutConstraint(item: loginView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.4, constant: 1)
        NSLayoutConstraint.activate([centerYAxis,centerXAxis,width,hight])
        }
    
    
    func addLoginLable(){
        loginLable.translatesAutoresizingMaskIntoConstraints = false
        loginLable.text = "START SWEATING"
        loginLable.textAlignment = .center
        loginLable.font = UIFont.systemFont(ofSize: 27, weight: .thin)
        loginView.addSubview(loginLable)
        let centerXAxis = NSLayoutConstraint(item: loginLable, attribute: .centerX, relatedBy: .equal, toItem: loginView, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYAxis = NSLayoutConstraint(item: loginLable, attribute: .centerY, relatedBy: .equal, toItem: loginView, attribute: .centerY, multiplier: 0.33, constant: 1)
        let width = NSLayoutConstraint(item: loginLable, attribute: .width, relatedBy: .equal, toItem: loginView, attribute: .width, multiplier: 0.8, constant: 1)
        let hight = NSLayoutConstraint(item: loginLable, attribute: .height, relatedBy: .equal, toItem: loginView, attribute: .height, multiplier: 0.2, constant: 1)
        NSLayoutConstraint.activate([centerYAxis,centerXAxis,width,hight])
    }
    
    
    func addEmailTextField(){
        emailTextField.placeholder = "Email address"
        emailTextField.textAlignment = .center
        emailTextField.layer.cornerRadius = 12
        emailTextField.addDoneButtonOnKeyboard()
        emailTextField.clipsToBounds = true
        emailTextField.keyboardType = .emailAddress
        emailTextField.textContentType = .emailAddress
        emailTextField.backgroundColor = .white
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        loginView.addSubview(emailTextField)
        
        let centerXAxis = NSLayoutConstraint(item: emailTextField, attribute: .centerX, relatedBy: .equal, toItem: loginView, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYAxis = NSLayoutConstraint(item: emailTextField, attribute: .centerY, relatedBy: .equal, toItem: loginLable, attribute: .centerY, multiplier: 2, constant: 1)
        let width = NSLayoutConstraint(item: emailTextField, attribute: .width, relatedBy: .equal, toItem: loginView, attribute: .width, multiplier: 0.7, constant: 1)
        let hight = NSLayoutConstraint(item: emailTextField, attribute: .height, relatedBy: .equal, toItem: loginLable, attribute: .height, multiplier: 0.4, constant: 1)
        NSLayoutConstraint.activate([centerYAxis,centerXAxis,width,hight])
    }
    
    func addPasswordTextField(){
        passwordTextField.placeholder = "Password"
        passwordTextField.textAlignment = .center
        passwordTextField.layer.cornerRadius = 12
        passwordTextField.clipsToBounds = true
        passwordTextField.addDoneButtonOnKeyboard()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white
        loginView.addSubview(passwordTextField)
        
        let centerXAxis = NSLayoutConstraint(item: passwordTextField, attribute: .centerX, relatedBy: .equal, toItem: loginView, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYAxis = NSLayoutConstraint(item: passwordTextField, attribute: .centerY, relatedBy: .equal, toItem: loginView, attribute: .centerY, multiplier: 1, constant: 1)
        let width = NSLayoutConstraint(item: passwordTextField, attribute: .width, relatedBy: .equal, toItem: emailTextField, attribute: .width, multiplier: 1, constant: 1)
        let hight = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: emailTextField, attribute: .height, multiplier: 1, constant: 1)
        NSLayoutConstraint.activate([centerYAxis,centerXAxis,width,hight])
        
    }
    
    
    
    func addLoginButton(){
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        loginButton.backgroundColor = #colorLiteral(red: 0, green: 0.2937047184, blue: 0.493035078, alpha: 1)
        loginButton.layer.cornerRadius = 12
        loginButton.clipsToBounds = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginWasPressed), for: .touchUpInside)
        loginView.addSubview(loginButton)
        
        let centerXAxis = NSLayoutConstraint(item: loginButton, attribute: .centerX, relatedBy: .equal, toItem: loginView, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYAxis = NSLayoutConstraint(item: loginButton, attribute: .centerY, relatedBy: .equal, toItem: loginView, attribute: .centerY, multiplier: 1.5, constant: 1)
        let width = NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: emailTextField, attribute: .width, multiplier: 1, constant: 1)
        let hight = NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy: .equal, toItem: emailTextField, attribute: .height, multiplier: 2, constant: 1)
        NSLayoutConstraint.activate([centerYAxis,centerXAxis,width,hight])
        
    }
    
    
    
    func addSocailMediaButtons(){
        socialMediaView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(socialMediaView)
        let centerXAxis = NSLayoutConstraint(item: socialMediaView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYAxis = NSLayoutConstraint(item: socialMediaView, attribute: .centerY, relatedBy: .equal, toItem: loginView, attribute: .centerY, multiplier: 2.3, constant: 1)
        let hight = NSLayoutConstraint(item: socialMediaView, attribute: .height, relatedBy: .equal, toItem: loginView, attribute: .height, multiplier: 1, constant: 1)
        let width = NSLayoutConstraint(item: socialMediaView, attribute: .width, relatedBy: .equal, toItem: loginView, attribute: .width, multiplier: 1, constant: 1)
        NSLayoutConstraint.activate([centerYAxis,centerXAxis,width,hight])

    }
    
    func addRegisterButton(){
        registerButton.layer.cornerRadius = 12
        registerButton.clipsToBounds = true
        registerButton.titleLabel?.textAlignment = .center
        registerButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = #colorLiteral(red: 0, green: 0.2937047184, blue: 0.493035078, alpha: 1)
        registerButton.addTarget(self, action: #selector(registerWasPressed), for: .touchUpInside)
        socialMediaView.addSubview(registerButton)
        let centerXAxis = NSLayoutConstraint(item: registerButton, attribute: .centerX, relatedBy: .equal, toItem: socialMediaView, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYAxis = NSLayoutConstraint(item: registerButton, attribute: .centerY, relatedBy: .equal, toItem: socialMediaView, attribute: .centerY, multiplier: 0.4, constant: 1)
        let width = NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy: .equal, toItem: socialMediaView, attribute: .width, multiplier: 1, constant: 1)
        let hight = NSLayoutConstraint(item: registerButton, attribute: .height, relatedBy: .equal, toItem: socialMediaView, attribute: .height, multiplier: 0.2, constant: 1)
        NSLayoutConstraint.activate([centerYAxis,centerXAxis,width,hight])
        
    }
    
    func addFaceBookLoginButton(){
        FBButton.layer.cornerRadius = 12
        FBButton.clipsToBounds = true
        FBButton.translatesAutoresizingMaskIntoConstraints = false
        FBButton.backgroundColor = #colorLiteral(red: 0, green: 0.2937047184, blue: 0.493035078, alpha: 1)
        socialMediaView.addSubview(FBButton)
        let centerXAxis = NSLayoutConstraint(item: FBButton, attribute: .centerX, relatedBy: .equal, toItem: socialMediaView, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYAxis = NSLayoutConstraint(item: FBButton, attribute: .centerY, relatedBy: .equal, toItem: socialMediaView, attribute: .centerY, multiplier: 1, constant: 1)
        let width = NSLayoutConstraint(item: FBButton, attribute: .width, relatedBy: .equal, toItem: socialMediaView, attribute: .width, multiplier: 1, constant: 1)
        let height = NSLayoutConstraint(item: FBButton, attribute: .height, relatedBy: .equal, toItem: socialMediaView, attribute: .height, multiplier: 0.2, constant: 1)
        NSLayoutConstraint.activate([centerYAxis,centerXAxis,width,height])
    }
    
    
    // MARK : - buttons actions
    
    @objc func registerWasPressed(sender: UIButton!){
        self.navigationController?.pushViewController(ConstantsForApp.registervc, animated: true)
    }
    
    @objc func loginWasPressed(sender:UIButton!) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if email != ""{
            if password != "" {
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                    guard self != nil else { return }
                    if error != nil {
                        let alert = UIAlertController(title: "ERROR", message: "Wrong email or password", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self!.present(alert, animated: true, completion: nil)
                    }
                    else {
                        self!.navigationController?.pushViewController(ConstantsForApp.setupvc, animated: true)
                    }
                }
                
            }
            else{
                let alert = UIAlertController(title: "invalid password", message: "Please use a valid password", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            let alert = UIAlertController(title: "invalid email", message: "Please use a valid email address", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }
    
}



}
