//
//  caculateBMI.swift
//  BMI Calculator
//
//  Created by ahmed sherif on 17/09/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct calculateBMI {
    
    func calculate(height:Float, weight: Float) -> Float {
        return weight / pow(height, 2)
    }
}
