//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI

struct ContentView: View {

    let weather: Weather

    var body: some View {
        VStack(spacing: 24) {
            DailyForecastView(minTemperature: weather.main.temp_min,
                              currentTemperature: weather.main.temp,
                              maxTemperature: weather.main.temp_max)
            .padding(.horizontal, 24)
            Divider()
                .frame(height: 1)
                .overlay(Color.appText)
        }
    }
}
