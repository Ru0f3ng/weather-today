//
//  CurrentWeather.swift
//  WeatherToday
//
//  Created by Laurent Liu on 15/03/2017.
//  Copyright © 2017 Laurent Liu. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    fileprivate var _date: String!
    fileprivate var _cityName: String!
    fileprivate var _weatherSummary: String!
    fileprivate var _currentTemp: Double!
    fileprivate var _weatherType: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherSummary: String {
        if _weatherSummary == nil {
            _weatherSummary = ""
        }
        return _weatherSummary
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    func parseDataFrom(weatherDict: Dictionary<String, AnyObject>) {
        if let timeZone = weatherDict["timezone"] as? String {
            self._cityName = timeZone
        }
        
        if let currently = weatherDict["currently"] as? Dictionary<String, AnyObject> {
            
            if let summary = currently["summary"] as? String {
                self._weatherSummary = summary
            }
            
            if let icon = currently["icon"] as? String {
                self._weatherType = icon
            }
            
            if let temperature = currently["temperature"] as? Double {
                let roundedTemperature = round(10 * temperature / 10)
                self._currentTemp = roundedTemperature
            }
        }
    }
    
}








