//
//  JSONParsing.swift
//  Clima
//
//  Created by ahmed sherif on 30/09/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

protocol weatherDelegate {
    func didUpdateWeather(information: decodedWeather)
    func errorHandler(error: Error)
}

struct JSONParsing {
    
    var delegate: weatherDelegate?
    
    
    let UrlString = "https://api.openweathermap.org/data/2.5/weather?&appid=febac4bec0f78d6ba9c748f47d0ab732&units=metric"
    
    func getCityName(cityName: String) {
        let myUrl = "\(UrlString)&q=\(cityName)"
        performRequest(myUrl: myUrl)
    }
    
    func getCityNameByCoordinates (latitude: Double, longitude: Double) {
        let myUrl = "\(UrlString)&lat=\(latitude)&lon=\(longitude)"
        performRequest(myUrl: myUrl)
    }
    
    func performRequest(myUrl: String) {
        if let url = URL(string: myUrl){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if (error != nil){
                    delegate?.errorHandler(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = decoding(responsedData: safeData){
                        self.delegate?.didUpdateWeather(information: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func decoding(responsedData: Data) -> decodedWeather? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(weatherManager.self, from: responsedData)
            let name = decodedData.name
            let tempreture = decodedData.main.temp
            let weatherID = decodedData.weather[0].id
            
            let decodedWeather = decodedWeather(tempreture: tempreture, name: name, id: weatherID)
            
            return decodedWeather
        } catch {
            delegate?.errorHandler(error: error)
            return nil
        }
    }
    /**
     make a url
     make url session
     give the url a task
     resume the task
     */
}
