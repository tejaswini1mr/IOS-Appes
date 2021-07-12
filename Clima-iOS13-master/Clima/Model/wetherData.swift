//
//  wetherData.swift
//  Clima
//
//  Created by Tejaswini MR on 03/11/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
struct WeatherData:Codable {
    let name:String
    let main : Main
    let weather:[Weather]
}
struct Main:Codable{
    let temp:Double
}
struct Weather:Codable{
    let description:String
    let id:Int
}
