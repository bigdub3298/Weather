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
    let iconImage: UIImage?
    
    lazy var temperatureF = {(temperatureK) in
        return (temperatureK - 32.0) * (5.0/9.0)
    }
    
    init(main: [String: Double], description: String, iconString: String) {
        self.main = main
        self.descrption = description
        self.iconString = iconString
        self.iconImage = nil
    }
    
    convenience init?(dictionary: [String: AnyObject]) {
        
        guard let mainFromDict = dictionary["main"] as? [String: Double],
            weather = dictionary["weather"] as? [String: AnyObject],
            desctriptionFromDict = weather["description"] as? String,
            iconStringFromDict = weather["icon"] as? String else {
            return nil
        }
        
        self.init(main: mainFromDict, description: desctriptionFromDict, iconString: iconStringFromDict)
    }
}
