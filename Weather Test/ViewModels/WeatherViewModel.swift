//
//  WeatherViewModel.swift
//  Weather Test
//
//  Created by Alex Sison on 4/1/24.
//

import Combine
import Foundation

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService
    
    @Published var weather = Weather()

    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    var temperature: String {
        if let temp = weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        }
    }
}
