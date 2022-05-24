//
//  deocodedWeather.swift
//  Clima
//
//  Created by ahmed sherif on 30/09/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct decodedWeather {
    var tempreture: Double
    var name: String
    var id: Int
    
    var tempString: String {
        return String(format: "%.1f", tempreture)
    }
    var getcondition: String{
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "sum.min"
        }
    }
}
