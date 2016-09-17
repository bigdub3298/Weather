//
//  WeatherController.swift
//  Weather
//
//  Created by Wesley Austin on 9/14/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import UIKit


class WeatherController {
    
    static let baseURLString = "http://api.openweathermap.org/data/2.5/weather?"
    static let appid = "970beadc4b90b64b0f5c6c58e0d79cc4"
    
    static func fetchWeather(searchTerm: String, completion: (weather: Weather?) -> Void) {
        
        let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        
        let completeURL = baseURLString + "appid=" + appid + "&q=" + escapedSearchTerm!
        
        NetworkController.dataAtURL(completeURL) { (data) in
            guard let data = data,
                let weatherJSON = NetworkController.jsonFromData(data) else { completion(weather: nil); return }
            
            let weather = Weather(dictionary: weatherJSON)
            completion(weather: weather) 
        }
    }
    
    static func imageFromURL(urlString: String, completion: (image: UIImage?) -> Void) {
        let completeURLString = "http://openweathermap.org/img/w/" + urlString + ".png"
        
        NetworkController.dataAtURL(completeURLString) { (data) in
            guard let data = data else {
                completion(image: nil)
                return
            }
            
            let image = UIImage(data: data)
            completion(image: image)
        }
    }
}