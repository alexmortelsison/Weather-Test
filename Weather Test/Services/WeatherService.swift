//
//  WeatherService.swift
//  Weather Test
//
//  Created by Alex Sison on 4/1/24.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=({city name})&appid=785bbc38e5ecd1a4507f8df8b366755e" ) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
