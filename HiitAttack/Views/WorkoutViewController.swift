//
//  WorkoutViewController.swift
//  HiitAttack
//
//  Created by Noam Efergan on 18/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import AVFoundation

class WorkoutViewController: UIViewController {
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        finishButton.applyRedGradiant()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    // MARK:- Variables
    
    
    var counterTimer1 = WorkoutTimes.defenativeWorkTime
    var counterTimer2 = WorkoutTimes.defenativeRestTime
    var reps = WorkoutTimes.reps
    var workoutTimer:Timer!
    var restTimer:Timer!
    var bellSoundEffect:AVAudioPlayer?

    
    let finishButton = UIButton()
    let repsLable = UILabel()
    let workOutTimerCircle = CAShapeLayer()
    let workOutTimerCircleTrack = CAShapeLayer()
    let restTimeCircle = CAShapeLayer()
    let restTimeCircleTrack = CAShapeLayer()
    
    //MARK:- View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addLableToCenter()
        addTrackToCircle()
        addFirstCircle()
        
        addRestTimeTrack()
        addRestTimeCircle()
        
        addFinishButton()
        
    }
    
    //MARK:- Adding Functions
    
    func addFirstCircle(){

        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 170 , startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        workOutTimerCircle.path = circularPath.cgPath
        workOutTimerCircle.strokeColor = #colorLiteral(red: 0.6347541809, green: 0.8305928707, blue: 0.1290796697, alpha: 1).cgColor
        workOutTimerCircle.lineWidth = 20
        workOutTimerCircle.lineCap = .round
        workOutTimerCircle.strokeEnd = 0
        workOutTimerCircle.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(workOutTimerCircle)
    }
    
    func addTrackToCircle(){
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 170 , startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        workOutTimerCircleTrack.path = circularPath.cgPath
        workOutTimerCircleTrack.strokeColor = UIColor.lightGray.cgColor
        workOutTimerCircleTrack.lineWidth = 20
        workOutTimerCircleTrack.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(workOutTimerCircleTrack)
    }
    
    func addRestTimeCircle(){
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 150 , startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        restTimeCircle.path = circularPath.cgPath
        restTimeCircle.strokeColor = #colorLiteral(red: 0.508666873, green: 0.7283167839, blue: 0.9941838384, alpha: 1).cgColor
        restTimeCircle.lineWidth = 20
        restTimeCircle.lineCap = .round
        restTimeCircle.strokeEnd = 0
        restTimeCircle.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(restTimeCircle)
    }
    func addRestTimeTrack(){
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 150 , startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        restTimeCircleTrack.path = circularPath.cgPath
        restTimeCircleTrack.strokeColor = UIColor.lightGray.cgColor
        restTimeCircleTrack.lineWidth = 20
        restTimeCircleTrack.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(restTimeCircleTrack)
        
    }
    
    func addLableToCenter(){
        repsLable.font = .systemFont(ofSize: 45, weight: .heavy)
        repsLable.numberOfLines = 0
        repsLable.textAlignment = .center
        repsLable.text = """
        Reps left:
        \(reps)
        """
        repsLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(repsLable)
        NSLayoutConstraint.activate([
            repsLable.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            repsLable.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 10)
    
        ])
    }
    
    
    func addFinishButton(){
        finishButton.setTitle("Finish workout", for: .normal)
        finishButton.titleLabel?.textAlignment = .center
        finishButton.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        finishButton.makeRoundedSquere()
        finishButton.addTarget(self, action: #selector(finishWasPressed), for: .touchUpInside)
        view.addSubview(finishButton)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            finishButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            finishButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.13),
            finishButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.7),
            finishButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20)
        ])
    }
    
    
    
    
    
    //MARK:- Buttons functions
    
    @objc func finishWasPressed(){
        finishButton.pulsate()
        let alert = UIAlertController(title: "End workout", message: "Are you sure you want to end the workout before its done?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (alert) in
            self.workoutTimer.invalidate()
            self.restTimer.invalidate()
            self.reps = 0
            self.navigationController?.pushViewController(ConstantsForApp.finalvc, animated: true)
        }))
        self.present(alert,animated: true, completion: nil)
    }


    // MARK:- Work out timers brain
    
    func runWorkoutTimer(){
        if reps > 0{
        playBellSound()
        workoutTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(workoutTimerRunning), userInfo: nil, repeats: true)
            
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = 0.795
            animation.duration = Double(WorkoutTimes.defenativeWorkTime)
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false
            workOutTimerCircle.add(animation, forKey: "circle animation - work")
        }
        else{

            self.navigationController?.pushViewController(ConstantsForApp.finalvc, animated: true)
        }
    }
    
    
    @objc func workoutTimerRunning(){
        if reps > 0{

        if counterTimer1 > 0 {
           

            counterTimer1 -= 1
        }
        else {
            workoutTimer.invalidate()
            runRestWorkout()
        }
        }
        else {
            workoutTimer.invalidate()
            self.navigationController?.pushViewController(ConstantsForApp.finalvc, animated: true)
        }
    }
    
    
    func runRestWorkout(){
        playBellSound()
        restTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(restWorkoutRunning), userInfo: nil, repeats: true)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 0.795
        animation.duration = Double(WorkoutTimes.defenativeRestTime)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        restTimeCircle.add(animation, forKey: "circle animation - rest")
    }
    
    @objc func restWorkoutRunning(){
        if counterTimer2 > 0 {
            

            counterTimer2 -= 1
        }
        else {
            if reps > 0{
                counterTimer1 = WorkoutTimes.defenativeWorkTime
                counterTimer2 = WorkoutTimes.defenativeRestTime
                restTimer.invalidate()
                reps -= 1
                
                repsLable.text = """
                Reps left:
                \(reps)
                """
                runWorkoutTimer()
                
            }
            else{
                restTimer.invalidate()
                workoutTimer.invalidate()

                
            }
        }
        
    }
    func playBellSound(){
        let soundPath = Bundle.main.path(forResource: "Boxing bell.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: soundPath)
        do{
            bellSoundEffect = try AVAudioPlayer(contentsOf: url)
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
            try? AVAudioSession.sharedInstance().setActive(true)
            bellSoundEffect?.play()
        }
        catch{
            print("error playing music")
        }
        
    }
}
