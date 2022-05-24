//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var Json = JSONParsing()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        searchTextField.delegate = self
        Json.delegate = self
    }
}

// MARK: - textField
extension WeatherViewController:UITextFieldDelegate {
    
    @IBAction func searchButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        //return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text == "" {
            searchTextField.placeholder = "Please enter a city name"
            return false
        } else {
            return true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.endEditing(true)
        if let cityname = searchTextField.text {
        Json.getCityName(cityName: cityname)
        }
        searchTextField.text = ""
    }
}

//MARK: - weather section
extension WeatherViewController: weatherDelegate {
    func errorHandler(error: Error) {
        print (error)
    }
    
    func didUpdateWeather(information: decodedWeather) {
        DispatchQueue.main.async {
            self.conditionImageView.image = UIImage(systemName: information.getcondition)
            self.cityLabel.text = information.name
            self.temperatureLabel.text = information.tempString
        }
    }
}

//MARK: - location section
extension WeatherViewController: CLLocationManagerDelegate {
    @IBAction func GPSbutton(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        if let location = locations.last {
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
            Json.getCityNameByCoordinates(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print (error)
    }
}
