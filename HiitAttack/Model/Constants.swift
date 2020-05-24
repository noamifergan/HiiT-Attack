//
//  Constants.swift
//  pactice
//
//  Created by Noam Efergan on 14/05/2020.
//  Copyright © 2020 Noam Efergan. All rights reserved.
//

import UIKit

class gradiants {
    func getGradiants() -> CAGradientLayer{
        
    let blueGradiant = CAGradientLayer()
    blueGradiant.colors = [UIColor.init(red: 105/255, green: 170/255, blue: 248/255, alpha: 1).cgColor, UIColor.init(red: 137/255, green: 190/255, blue: 251/255, alpha: 1).cgColor]
        
        return blueGradiant
    }
}
