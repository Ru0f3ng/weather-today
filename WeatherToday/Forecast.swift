//
//  Forecast.swift
//  WeatherToday
//
//  Created by Laurent Liu on 15/03/2017.
//  Copyright © 2017 Laurent Liu. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    fileprivate var _currentHour: String!
    fileprivate var _tempAtCurrentHour: Double!
    fileprivate var _weatherType: String!
    
    var currentHour: String {
        if _currentHour == nil {
            _currentHour = ""
        }
        return _currentHour
    }
    
    var tempAtCurrentHour: Double {
        if _tempAtCurrentHour == nil {
            _tempAtCurrentHour = 0.0
        }
        return _tempAtCurrentHour
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    func parseDataFrom(weatherDict: Dictionary<String, AnyObject>) {
        if let temperature = weatherDict["temperature"] as? Double {
            let roundedTemperature = round(10 * temperature / 10)
            self._tempAtCurrentHour = roundedTemperature
        }
        
        if let icon = weatherDict["icon"] as? String {
            self._weatherType = icon
        }
        
        if let time = weatherDict["time"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: time)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .none
            
            self._currentHour = unixConvertedDate.hourOfTheDay()
        }
    }
}

extension Date {
    func hourOfTheDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        
        return dateFormatter.string(from: self)
    }
}


