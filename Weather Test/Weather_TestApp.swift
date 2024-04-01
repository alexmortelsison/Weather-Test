//
//  Weather_TestApp.swift
//  Weather Test
//
//  Created by Alex Sison on 4/1/24.
//

import SwiftUI

@main
struct Weather_TestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(weathervm: WeatherViewModel(weatherService: WeatherService()))
        }
    }
}
