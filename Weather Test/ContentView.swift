//
//  ContentView.swift
//  Weather Test
//
//  Created by Alex Sison on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weathervm: WeatherViewModel

    init(weathervm: WeatherViewModel) {
        self.weathervm = weathervm
    }

    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter city", text: self.$weathervm.cityName) {
                self.weathervm.search()
            }.font(.custom("Arial", size: 50))
                .padding()
                .fixedSize()

            Text(self.weathervm.temperature)
                .font(.custom("Arial", size: 100))
                .foregroundStyle(Color.white)
                .offset(y: 100)
                .padding()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color.blue)
    }
}

#Preview {
    ContentView(weathervm: WeatherViewModel(weatherService: WeatherService()))
}
