//
//  SetupViewController.swift
//  HiitAttack
//
//  Created by Noam Efergan on 15/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SetupViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

        
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        firstCube.applyBlueGradiant()
        secondCube.applyBlueGradiant()
        thirdCube.applyBlueGradiant()
        startButton.applyGreenGradiant()
    }
    // MARK: - Variables
    
    let firstCube = UIView()
    let secondCube = UIView()
    let thirdCube = UIView()
    let startButton = UIButton()
    let settingsButton = UIButton()
    let lapLable = UILabel()
    let restLable = UILabel()
    let repsLable = UILabel()
    let lapsPicker = UIPickerView()
    let restPicker = UIPickerView()
    let repsPicker = UIPickerView()
    let myPresistedData = presistedData()
        
    var timeArray = Array(0...59)
        
    // MARK: - view did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lapsPicker.delegate = self
        restPicker.delegate = self
        repsPicker.delegate = self
        addFirstCube()
        addSecondCube()
        addThirdCube()
        addStartButton()
        addSettingsButton()
        addLableToCube(lable: lapLable, lableText: "Lap time", parentView: firstCube)
        addLableToCube(lable: restLable, lableText: "Rest Time", parentView: secondCube)
        addLableToCube(lable: repsLable, lableText: "Reps", parentView: thirdCube)
        addPickerToCube(picker: lapsPicker, parentView: firstCube,tag: 0)
        addPickerToCube(picker: restPicker, parentView: secondCube,tag: 1)
        addPickerToCube(picker: repsPicker, parentView: thirdCube,tag: 2)
        
        if((AccessToken.current) != nil) {
            GraphRequest(graphPath: "me", parameters: ["fields": "name"]).start(completionHandler: {(connection, result, error) -> Void in
                
                if(error != nil) {
                    print("Some error occurred.");
                } else {
                    let goodResult:Dictionary = result! as! Dictionary<String, String>
                        self.myPresistedData.nameOfUser = "Hello ," + goodResult["name"]!
                    try! realm.write{
                        if !ConstantsForApp.results.isEmpty{
                            ConstantsForApp.results.first?.nameOfUser = self.myPresistedData.nameOfUser

                        }
                        else {
                            realm.add(self.myPresistedData)
                        }
                    }
                    
                }
            })
        }

    }
    
        // MARK: - Adding Fuctions
    func addFirstCube(){
        firstCube.makeRoundedSquere()
        view.addSubview(firstCube)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            firstCube.topAnchor.constraint(equalTo: margins.topAnchor, constant: 40),
            firstCube.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            firstCube.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.8),
            firstCube.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.22)
        ])


    }
    
    func addSecondCube(){
        secondCube.makeRoundedSquere()
        view.addSubview(secondCube)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            secondCube.topAnchor.constraint(equalTo: firstCube.bottomAnchor, constant:30),
            secondCube.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            secondCube.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.8),
            secondCube.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.22)
        
        ])
    }
    
    func addThirdCube(){
        thirdCube.makeRoundedSquere()
        view.addSubview(thirdCube)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            thirdCube.topAnchor.constraint(equalTo: secondCube.bottomAnchor, constant:30),
            thirdCube.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            thirdCube.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.8),
            thirdCube.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.22)
            
        ])
    }
    
    func addStartButton(){
        startButton.makeRoundedSquere()
        startButton.setTitle("START!", for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 32, weight: .light)
        startButton.addTarget(self, action: #selector(startWasPressed), for: .touchUpInside)
        view.addSubview(startButton)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: thirdCube.bottomAnchor, constant: 30),
            startButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            startButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.85),
            startButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.11)
        ])
    }
    
    func addLableToCube(lable: UILabel,lableText: String, parentView: UIView){
        lable.qubeLable(text: lableText)
        lable.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(lable)
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0),
            lable.widthAnchor.constraint(equalTo: parentView.widthAnchor),
            lable.heightAnchor.constraint(equalTo: parentView.heightAnchor, multiplier: 0.4)
        ])
    }
    
    func addPickerToCube(picker: UIPickerView, parentView: UIView,tag: Int){
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.tag = tag
        parentView.addSubview(picker)
        NSLayoutConstraint.activate([
            picker.bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            picker.widthAnchor.constraint(equalTo: parentView.widthAnchor),
            picker.heightAnchor.constraint(equalTo: parentView.heightAnchor, multiplier: 0.5)
        ])
    }

    func addSettingsButton(){
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
        let largeBoldGear = UIImage(systemName: "gear", withConfiguration: largeConfig)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.setImage(largeBoldGear, for: .normal)
        settingsButton.contentMode = .center
        settingsButton.imageView?.contentMode = .scaleAspectFit
        settingsButton.addTarget(self, action: #selector(settingsWasPressed), for: .touchUpInside)
        view.addSubview(settingsButton)
        let margins = view.layoutMarginsGuide
            NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo:margins.topAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            settingsButton.widthAnchor.constraint(equalToConstant: 40),
            settingsButton.heightAnchor.constraint(equalToConstant: 40)
    
        ])
    }
    
    //MARK:- Buttons actions
    
    @objc func settingsWasPressed(){
        navigationController?.pushViewController(ConstantsForApp.settingsvc, animated: true)
}
    
    @objc func startWasPressed(){
        navigationController?.pushViewController(ConstantsForApp.workoutVC, animated: true)
        ConstantsForApp.workoutVC.runWorkoutTimer()
        
    }
}
