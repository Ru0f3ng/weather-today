//
//  AlamofireDownload.swift
//  WeatherToday
//
//  Created by Laurent Liu on 15/03/2017.
//  Copyright © 2017 Laurent Liu. All rights reserved.
//

import Alamofire

class AlamofireDownload {
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                currentWeather.parseDataFrom(weatherDict: dict)
            }
            completed()
        }
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let hourly = dict["hourly"] as? Dictionary<String, AnyObject> {
                    
                    if let data = hourly["data"] as? [Dictionary<String, AnyObject>] {
                        
                        for object in data[0..<24] {
                            let forecast = Forecast()
                            forecast.parseDataFrom(weatherDict: object)
                            forecasts.append(forecast)
                        }
                        forecasts.remove(at: 0)
                    }
                }
            }
            completed()
        }
    }
}




