//
//  Constants.swift
//  WeatherToday
//
//  Created by Laurent Liu on 15/03/2017.
//  Copyright © 2017 Laurent Liu. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "https://api.darksky.net/forecast/4be699b21544f952de44fa63a080ce29/\(Location.sharedInstance.latitude!),\(Location.sharedInstance.longitude!)?units=auto"
