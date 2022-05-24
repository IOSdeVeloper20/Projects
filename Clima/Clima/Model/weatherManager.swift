//
//  weatherManager.swift
//  Clima
//
//  Created by ahmed sherif on 30/09/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct weatherManager: Codable{
    var name: String
    var weather: [weatherInfo]
    var main: main
    
}


struct main: Codable {
    var temp: Double
}

struct weatherInfo: Codable {
    var id: Int
}
