//
//  Weather.swift
//  Weather Test
//
//  Created by Alex Sison on 4/1/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
