//
//  WeatherTodayVC.swift
//  WeatherToday
//
//  Created by Laurent Liu on 15/03/2017.
//  Copyright © 2017 Laurent Liu. All rights reserved.
//

import UIKit
import Alamofire

var currentWeather = CurrentWeather()
var forecasts = [Forecast]()

class WeatherTodayVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var forecast: Forecast!
    var alamofireDownload: AlamofireDownload!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        alamofireDownload = AlamofireDownload()
        
        alamofireDownload.downloadWeatherDetails {
            self.updateMainUI()
        }
        
        alamofireDownload.downloadForecastData {
            forecasts.remove(at: 0)
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell
        {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            
            return cell
        }
        else
        {
            return WeatherCell()
        }
    }
    
    func updateMainUI()
    {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)°"
        locationLabel.text = currentWeather.cityName
        currentWeatherTypeLabel.text = currentWeather.weatherSummary
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
   
}











