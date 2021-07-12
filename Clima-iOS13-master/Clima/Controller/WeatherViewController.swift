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

    @IBAction func GPSLocation(_ sender: Any) {
        locationManager.requestLocation()
        
    }
    @IBOutlet weak var searchTextFeild: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate=self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        //locationManager.startUpdatingLocation() for continues dynamikally changing location
        weatherManager.deligate=self
        searchTextFeild.delegate=self//it intaracts with view controller and updates user actions on it.
        // Do any additional setup after loading the view.
    }
}
//MARK: - UITextFieldDelegate
extension WeatherViewController:UITextFieldDelegate{
    @IBAction func searchButton(_ sender: UIButton) {
        searchTextFeild.endEditing(true)
        

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextFeild.endEditing(true)
        return true
    }//it asks the delegete the text should process on return button
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder="type something"
            return false
        }
    }
    //textField trigger deligate function textfeildEndEditing
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city=searchTextFeild.text{
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextFeild.text=""
    }
    
}

//MARK: -WeatherManagerDeligate
extension WeatherViewController:WeatherManagerDeligate{
    //weathermanger triggers deligate function didUpdateWeatger function
    func didUpdateWeather(_ weatherManeger:WeatherManager,weather:WeatherModel){
        DispatchQueue.main.async {
            
            self.temperatureLabel.text=weather.temperatures
            self.conditionImageView.image=UIImage(systemName: weather.conditionName)
            self.cityLabel.text=weather.cityName
            
        }
        print(weather.temp)
    }
    func didFailWithError(error:Error){
        print(error)
    }
    
}

//MARK: -CLLocationManagerDelegate
extension WeatherViewController:CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location=locations.last{
            locationManager.stopUpdatingLocation()
            let lat=location.coordinate.latitude
            let lon=location.coordinate.longitude
            weatherManager.fetchWeather(latitude:lat,longitude:lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
}

