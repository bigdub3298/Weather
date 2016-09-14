//
//  NetworkController.swift
//  Weather
//
//  Created by Wesley Austin on 9/14/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func dataAtURL(urlString: String, completion: (data: NSData?) -> Void) {
        
        guard let url = NSURL(string: urlString) else { completion(data: nil); return }
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) in
            if let error = error {
                print("Error in \(#function) - \(error.localizedDescription)")
                completion(data: nil)
                return
            } else {
                completion(data: data)
            }
        }
        
        task.resume()
    }
    
    static func jsonFromData(data: NSData) -> [String: AnyObject]? {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject]
            return json
        } catch {
            return nil
        }
    }
}