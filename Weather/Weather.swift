//
//  Weather.swift
//  Weather
//
//  Created by Wesley Austin on 9/10/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import UIKit

class Weather {
    
    let main: [String: Double]
    let descrption: String
    let iconString: String
    var iconImage: UIImage?
    let name: String
    
    init(main: [String: Double], description: String, iconString: String, name: String) {
        self.main = main
        self.descrption = description
        self.iconString = iconString
        self.iconImage = nil
        self.name = name
    }
    
    convenience init?(dictionary: [String: AnyObject]) {
        
        guard let mainFromDict = dictionary["main"] as? [String: Double],
            name = dictionary["name"] as? String,
        weather = dictionary["weather"] as? [[String: AnyObject]],
            desctriptionFromDict = weather[0]["description"] as? String,
            iconStringFromDict = weather[0]["icon"] as? String else {
            return nil
        }
        
        self.init(main: mainFromDict, description: desctriptionFromDict, iconString: iconStringFromDict, name: name)
    }
}
