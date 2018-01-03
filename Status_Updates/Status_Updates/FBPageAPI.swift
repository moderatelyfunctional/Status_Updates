//
//  WeatherAPI.swift
//  Status_Updates
//
//  Created by Jing Lin on 12/25/17.
//  Copyright © 2017 Jing Lin. All rights reserved.
//

import Foundation

typealias JSON = [String:AnyObject]

class FBPageAPI {
    
    struct PageMeta {
        let name:String
        let likes:Int
        let updated:Date
        let status:Int
    }

    let BASE_URL = "https://graph.facebook.com/v2.9"
    var ACCESS_TOKEN = ""
    
    static let sharedInstance:FBPageAPI = FBPageAPI()
    
    private init() {
        if let token = UserDefaults.standard.object(forKey: "FB_ACCESS_TOKEN") {
            self.ACCESS_TOKEN = token as! String
        }
    }
    
    func metaFromError(status: Int) -> PageMeta {
        return PageMeta(name: "", likes: 0, updated: Date(), status: status)
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
        
        let pageMeta = PageMeta(name: pageName as! String, likes: pageLikes as! Int, updated: Date(timeIntervalSince1970: postUpdated), status: 200)
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
                    success(self.metaFromError(status: 401))
                default:
                    NSLog("FB API returned response: %d %@", httpResponse.statusCode, HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
                    success(self.metaFromError(status: httpResponse.statusCode))
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
        let timeUntil = round(Date().timeIntervalSince1970)
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
    
    func fetchPage(_ query: String, success: @escaping (Int, PageData) -> Void) {
        self.fetchMeta(query) { pageMeta in
            var numPosts = -1
            if (pageMeta.status == 200) {
                self.fetchPosts(query) { pagePosts in
                    numPosts = pagePosts
                }
            }
            let pageData = PageData(id: query, name: pageMeta.name, likes: pageMeta.likes, updated: pageMeta.updated, nPosts: numPosts)
            success(pageMeta.status, pageData)
        }
    }

}



