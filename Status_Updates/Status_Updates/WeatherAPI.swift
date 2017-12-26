//
//  WeatherAPI.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Foundation

class WeatherAPI {
    
    let API_KEY = KEYS.WEATHER_API_KEY
    let BASE_URL = KEYS.WEATHER_BASE_URL
    
    func weatherFromJSON(_ data: Data) -> Weather? {
        let json:JSON
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! JSON
        } catch {
            NSLog("JSON parsing failed: \(error)")
            return nil
        }
        
        let mainDict = json["main"] as! JSON
        let weatherList = json["weather"] as! [JSON]
        let weatherDict = weatherList[0]
        
        let weather = Weather(city: json["name"] as! String,
                              currentTemp: mainDict["temp"] as! Float,
                              conditions: weatherDict["main"] as! String)
        
        return weather
    }
    
    func fetchWeather(_ query: String, success: @escaping (Weather) -> Void) {
        let session = URLSession.shared
        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = URL(string: "\(BASE_URL)?APPID=\(API_KEY)&units=imperial&q=\(escapedQuery!)")
        let task = session.dataTask(with: url!) { data, response, err in
            if let error = err {
                NSLog("Weather API Error: \(error)")
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if let weather = self.weatherFromJSON(data!) {
                        success(weather)
                    }
                case 401:
                    NSLog("Weather API Unauthorized Error")
                default:
                    NSLog("Weather API returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                }
            }
        }
        task.resume()
    }
    
    
}
