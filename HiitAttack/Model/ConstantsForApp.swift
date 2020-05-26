//
//  UserInformation.swift
//  HiitAttack
//
//  Created by Noam Efergan on 17/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit
import RealmSwift

struct ConstantsForApp {
    static let vc = ViewController()
    static let registervc = RegisterViewController()
    static let setupvc = SetupViewController()
    static let settingsvc = SettingsViewController()
    static let workoutVC = WorkoutViewController()
    static let finalvc = FinalViewController()
    static let results = realm.objects(presistedData.self)
    
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

class presistedData:Object{
    @objc dynamic var logOutWord:String = "Logout"
    @objc dynamic var nameOfUser:String = "User"

}
