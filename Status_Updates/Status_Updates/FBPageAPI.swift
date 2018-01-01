//
//  WeatherAPI.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Foundation

class FBPageAPI {
    
    struct PageMeta {
        let name:String
        let likes:Int
        let updated:NSDate
    }

    let BASE_URL = "https://graph.facebook.com/v2.9"
    var ACCESS_TOKEN = ""
    
    static let sharedInstance:FBPageAPI = FBPageAPI()
    
    private init() {
        let preferences = UserDefaults.standard
        
    
    }
    
    func metaFromJSON(_ data: Data) -> PageMeta? {
        let json:JSON
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! JSON
        } catch {
            NSLog("JSON parsing failed: \(error)")
            return nil
        }
        
        let pageName = json["name"]
        let pageLikes = json["fan_count"]
        
        let posts = json["posts"] as! JSON
        let postList = posts["data"] as! [JSON]
        let postUpdated = postList[0]["created_time"] as! TimeInterval
        
        let pageMeta = PageMeta(name: pageName as! String, likes: pageLikes as! Int, updated: NSDate(timeIntervalSince1970: postUpdated))
        return pageMeta
    }
    
    func fetchMeta(_ query: String, success: @escaping (PageMeta) -> Void) {
        let session = URLSession.shared
        let rawURLStr = "\(BASE_URL)/\(query)?access_token=\(ACCESS_TOKEN)&fields=name,fan_count,posts&date_format=U"
        let escapedURL = rawURLStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = URL(string: escapedURL!)
        let task = session.dataTask(with: url!) { data, response, err in
            if let error = err {
                NSLog("FB API Error: \(error)")
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if let pageMeta = self.metaFromJSON(data!) {
                        success(pageMeta)
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

    func postsFromJSON(_ data: Data) -> Int? {
        let json:JSON
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! JSON
        } catch {
            NSLog("JSON parsing failed: \(error)")
            return nil
        }
        
        let posts = json["data"] as! [JSON]
        return posts.count
    }

    func fetchPosts(_ query: String, success: @escaping (Int) -> Void) {
        let timeUntil = round(NSDate().timeIntervalSince1970)
        let day:TimeInterval = 60 * 60 * 24
        let timeSince = timeUntil - day
        let session = URLSession.shared
        let rawURLStr = "\(BASE_URL)/\(query)/posts?access_token=\(ACCESS_TOKEN)&limit=100&since=\(timeSince)&until=\(timeUntil)"
        let escapedURL = rawURLStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = URL(string: escapedURL!)
        let task = session.dataTask(with: url!) { data, response, err in
            if let error = err {
                NSLog("FB API Error: \(error)")
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if let pagePosts = self.postsFromJSON(data!) {
                        success(pagePosts)
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
    
    func fetchPage(_ query: String, success: @escaping (PageData) -> Void) {
        self.fetchMeta(query) { pageMeta in
            self.fetchPosts(query) { pagePosts in
                let pageData = PageData(id: query, name: pageMeta.name, likes: pageMeta.likes, updated: pageMeta.updated, nPosts: pagePosts)
                success(pageData)
            }
        }
    }
    
    func statusFromJSON(_ data: Data) -> PageStatus? {
        let json:JSON
        
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! JSON
        } catch {
            NSLog("JSON parsing failed: \(error)")
            return nil
        }
        
        return PageStatus(name: json["name"] as! String, status: 200)
    }
    
    func fetchStatus(_ query: String, success: @escaping (PageStatus) -> Void) {
        let session = URLSession.shared
        let rawURLStr = "\(BASE_URL)/\(query)?access_token=\(ACCESS_TOKEN)&fields=name"
        let escapedURL = rawURLStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = URL(string: escapedURL!)
        let task = session.dataTask(with: url!) { data, response, err in
            if let error = err {
                NSLog("FB API Error: \(error)")
                success(PageStatus(name: "", status: 0))
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if let pageStatus = self.statusFromJSON(data!) {
                        success(pageStatus)
                    }
                case 401:
                    NSLog("FB API Unauthorized Error")
                    success(PageStatus(name: "", status: 401))
                default:
                    NSLog("FB API returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                    success(PageStatus(name: "", status: httpResponse.statusCode))
                }
            }
        }
        task.resume()
    }
}



