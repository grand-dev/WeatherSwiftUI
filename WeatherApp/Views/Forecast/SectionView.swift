//
//  SectionView.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI

struct SectionView: View {

    var date: Date
    var dailyWeather: [Weather]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(formattedDate(date))
                .font(.appBodyBold)
                .foregroundColor(.appText)

            ForEach(
                dailyWeather.sorted { $0.dt < $1.dt },
                id: \.dt
            ) { weather in
                ItemView(weather: weather)
            }
        }
    }
}
