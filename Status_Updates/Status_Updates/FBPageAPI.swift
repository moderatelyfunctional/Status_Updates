//
//  WeatherAPI.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Foundation

class FBPageAPI {
    
    let BASE_URL = KEYS.FB_BASE_URL
    let ACCESS_TOKEN = KEYS.FB_ACCESS_TOKEN
    
    func pageFromJSON(_ data: Data) -> Page? {
        let json:JSON
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! JSON
        } catch {
            NSLog("JSON parsing failed: \(error)")
            return nil
        }
        
        let postList = json["data"] as! [JSON]
        let postDict = postList[0]
        
        let page = Page(time: postDict["created_time"] as! String,
                        content: postDict["message"] as! String,
                        ID: postDict["id"] as! String)
        
        return page
    }
    
    func fetchPage(_ query: String, success: @escaping (Page) -> Void) {
        let session = URLSession.shared
        let rawURLStr = "\(BASE_URL)/\(query)/posts?access_token=\(ACCESS_TOKEN)"
        let escapedURL = rawURLStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = URL(string: escapedURL!)
        NSLog("URL: \(BASE_URL)/\(query)/posts?limit=50?access_token=\(ACCESS_TOKEN)")
        NSLog("URL: \(url)")
        let task = session.dataTask(with: url!) { data, response, err in
            if let error = err {
                NSLog("FB API Error: \(error)")
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if let page = self.pageFromJSON(data!) {
                        success(page)
                    }
                case 401:
                    NSLog("FB API Unauthorized Error")
                default:
                    NSLog("FB API returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                }
            }
        }
        task.resume()
    }
}
