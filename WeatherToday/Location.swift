//
//  Location.swift
//  WeatherToday
//
//  Created by Laurent Liu on 16/03/2017.
//  Copyright © 2017 Laurent Liu. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
