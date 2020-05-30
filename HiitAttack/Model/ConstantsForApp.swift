//
//  UserInformation.swift
//  HiitAttack
//
//  Created by Noam Efergan on 17/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import Firebase


struct ConstantsForApp {
    static let vc = ViewController()
    static let registervc = RegisterViewController()
    static let setupvc = SetupViewController()
    static let settingsvc = SettingsViewController()
    static let workoutVC = WorkoutViewController()
    static let finalvc = FinalViewController()
    static var userName = ""
    static var ref:DatabaseReference! = Database.database().reference()
        
}

struct WorkoutTimes {
    static var workoutMinutes:Int = 0
    static var workoutSeconds:Int = 0
    static var restMinuts:Int = 0
    static var restSecond:Int = 0
    static var reps:Int = 0
    
    
    
    static var defenativeWorkTime = (WorkoutTimes.workoutMinutes * 60) + WorkoutTimes.workoutSeconds
    static var defenativeRestTime = (WorkoutTimes.restMinuts * 60) + WorkoutTimes.restSecond

}
