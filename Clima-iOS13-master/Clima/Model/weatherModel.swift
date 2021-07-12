//
//  weatherModel.swift
//  Clima
//
//  Created by Tejaswini MR on 04/11/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId:Int
    let cityName:String
    let temp:Double
    var temperatures:String{
        return String(format: "%.1f", temp)
        
    }
    
    var conditionName:String{//computed property
        switch conditionId {
        case 200...232:
            return "cloud.sun.bolt.fill"
        case 300...321:return "cloud.drizzle.fill"
        case 500...531:return"cloud.sun.rain.fill"
        case 600...622:return"snow"
        case 701...781:return"text.aligncenter"
        case 800:return"sun.min.fill"
        case 801...805:return"cloud.sun.fill"
        
        default:
            return"error"
        }

    }
    
    
}

