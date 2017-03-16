//
//  WeatherCell.swift
//  WeatherToday
//
//  Created by Laurent Liu on 15/03/2017.
//  Copyright © 2017 Laurent Liu. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var weatherTypeImage: UIImageView!
    @IBOutlet weak var tempAtCurrentHourLabel: UILabel!
    
    func configureCell(forecast: Forecast)
    {
        hourLabel.text = "\(forecast.currentHour)h"
        tempAtCurrentHourLabel.text = "\(forecast.tempAtCurrentHour)°"
        weatherTypeImage.image = UIImage(named: forecast.weatherType)
    }

}
