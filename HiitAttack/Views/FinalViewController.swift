//
//  FinalViewController.swift
//  HiitAttack
//
//  Created by Noam Efergan on 20/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    //MARK:- Apply gradiants
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        workoutTimeBackground.applyYellowGradiant()
        shareButton.applyOrangeradiant()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK:- Variables
    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    let topLable = UILabel()
    let workoutTimeLable = UILabel()
    let workoutTimeBackground = UIView()
    let shareButton = UIButton()
    let name = ConstantsForApp.results.first!.nameOfUser.components(separatedBy: ",")
    
    
    //MARK:- view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image = UIImage(named: "Final background")
        view.addSubview(backgroundImage)
        addTopLable()
        addWorkOutTimeBackground()
        addWorkTimeLable()
        addShareButton()
        
        

        
    }
    
    
    //MARK:- Adding functions
    
    func addTopLable(){
        topLable.translatesAutoresizingMaskIntoConstraints = false
        topLable.font = .systemFont(ofSize: 39, weight: .light)
        topLable.numberOfLines = 0
        topLable.textAlignment = .center
        topLable.textColor = .white
        topLable.text = "Great job, " + "\(name[1])"
        view.addSubview(topLable)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            topLable.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            topLable.topAnchor.constraint(equalTo: margins.topAnchor, constant: 80),
            topLable.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.7),
            topLable.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.2)
        ])
    }
    
    func addWorkOutTimeBackground(){
        workoutTimeBackground.makeRoundedSquere()
        workoutTimeBackground.alpha = 0.8
        view.addSubview(workoutTimeBackground)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            workoutTimeBackground.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            workoutTimeBackground.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.85),
            workoutTimeBackground.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: 40),
            workoutTimeBackground.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.1)
        ])
    }
    
    func addWorkTimeLable(){
        workoutTimeLable.translatesAutoresizingMaskIntoConstraints = false
        workoutTimeLable.font = .systemFont(ofSize: 20, weight: .light)
        workoutTimeLable.textAlignment = .center
        workoutTimeLable.numberOfLines = 0
        workoutTimeLable.text = "You've worked out for \(WorkoutTimes.workoutMinutes * WorkoutTimes.reps) minutes and \(WorkoutTimes.workoutSeconds * WorkoutTimes.reps) seconds!"
        workoutTimeBackground.addSubview(workoutTimeLable)
        let margins = workoutTimeBackground.layoutMarginsGuide
        NSLayoutConstraint.activate([
            workoutTimeLable.centerYAnchor.constraint(equalTo: margins.centerYAnchor),
            workoutTimeLable.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            workoutTimeLable.heightAnchor.constraint(equalTo: margins.heightAnchor),
            workoutTimeLable.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.8)
        ])
    }
    
    func addShareButton(){
        shareButton.makeRoundedSquere()
        shareButton.setTitle("Share you workout!", for: .normal)
        shareButton.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        shareButton.titleLabel?.textAlignment = .center
        shareButton.addTarget(self, action: #selector(shareWasPresser), for: .touchUpInside)
        view.addSubview(shareButton)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            shareButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -40),
            shareButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.8),
            shareButton.heightAnchor.constraint(equalToConstant: 70),
            shareButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
        ])
        
    }
    
    //MARK:- buttons actions
    
    @objc func shareWasPresser(){
        let activityVC = UIActivityViewController(activityItems: ["I've just finished my HiiT training! I've worked out for \(WorkoutTimes.workoutMinutes) minutes and \(WorkoutTimes.workoutSeconds) seconds for \(WorkoutTimes.reps) reps!"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        present(activityVC, animated: true, completion: nil)
        
    }
    


}
