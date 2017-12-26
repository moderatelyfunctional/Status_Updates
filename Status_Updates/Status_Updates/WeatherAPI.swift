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
    
    func fetchWeather(_ query: String) {
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
                    if let output_data = String(data: data!, encoding: .utf8) {
                        NSLog(output_data)
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
