//
//  ListView.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI

struct ListView: View {

    var dailyWeather: [Weather]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                let groupedWeather = groupWeatherByDay(dailyWeather)
                
                ForEach(Array(groupedWeather.keys.sorted(by: <)), id: \.self) { date in
                    SectionView(date: date, dailyWeather: groupedWeather[date] ?? [])
                }
            }
        }
    }
}
