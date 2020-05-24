//
//  Extantions.swift
//  HiitAttack
//
//  Created by Noam Efergan on 15/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit


//MARK:- extentions for view
extension UIView{
    
    func applyOrangeradiant(){
        let orangeGradiant = CAGradientLayer()
        orangeGradiant.colors = [UIColor.init(red: 258/255, green: 116/255, blue: 73/255, alpha: 1).cgColor, UIColor.init(red: 255/255, green: 155/255, blue: 123/255, alpha: 1).cgColor]
        orangeGradiant.frame = self.bounds
        self.layer.insertSublayer(orangeGradiant, at: 0)
    }
    
    func applyRedGradiant(){
        let redGradiant = CAGradientLayer()
        redGradiant.colors = [UIColor.init(red: 255/255, green: 107/255, blue: 100/255, alpha: 1).cgColor, UIColor.init(red: 245/255, green: 172/255, blue: 168/255, alpha: 1).cgColor]
        redGradiant.frame = self.bounds
        self.layer.insertSublayer(redGradiant, at: 0)
    }
    
    func applyBlueGradiant(){
        let blueGradiant = CAGradientLayer()
        blueGradiant.colors = [UIColor.init(red: 105/255, green: 170/255, blue: 248/255, alpha: 1).cgColor, UIColor.init(red: 137/255, green: 190/255, blue: 251/255, alpha: 1).cgColor]
        blueGradiant.frame = self.bounds
        self.layer.insertSublayer(blueGradiant, at: 0)
    }
    
    func applyGreenGradiant(){
        let greenGradiant = CAGradientLayer()
        greenGradiant.colors = [UIColor.init(red: 138/255, green: 190/255, blue: 41/255, alpha: 1).cgColor, UIColor.init(red: 182/255, green: 226/255, blue: 65/255, alpha: 1).cgColor]
        greenGradiant.frame = self.bounds
        self.layer.insertSublayer(greenGradiant, at: 0)
        
    }
    
    func applyYellowGradiant(){
        let yellowGradiant = CAGradientLayer()
        yellowGradiant.colors = [UIColor.init(red: 255/255, green: 217/255, blue: 100/255, alpha: 1).cgColor, UIColor.init(red: 200/255, green: 163/255, blue: 51/255, alpha: 1).cgColor]
        yellowGradiant.frame = self.bounds
        self.layer.insertSublayer(yellowGradiant, at: 0)
        
    }
    
    func makeRoundedSquere(){
        self.layer.cornerRadius = 26
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
//MARK:- extentions for textview
extension UITextView {
    func makeRoundeAndWhite(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 12
        self.backgroundColor = .white
    }
}
//MARK:- extentions for lable
extension UILabel{
    
    func qubeLable(text:String){
        self.text = "\(text)"
        self.textAlignment = .center
        self.font = .systemFont(ofSize: 28, weight: .light)
        self.textColor = .white


    }
}
//MARK:- extention for buttons

extension UIButton{
    
    func pulsate(){
        let pusle = CASpringAnimation(keyPath: "transform.scale")
        pusle.duration = 0.35
        pusle.fromValue = 0.9
        pusle.toValue = 1
        pusle.autoreverses = false
//        pusle.repeatCount = 0
        pusle.initialVelocity = 1
        pusle.damping = 20
        
        layer.add(pusle, forKey: nil)
    }
    
}

//MARK:- extentions for texfields

extension UITextField{
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}

