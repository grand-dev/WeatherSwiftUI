//
//  DailyforecastView.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI
import Resources

struct DailyForecastView: View {

    let minTemperature: Double
    let currentTemperature: Double
    let maxTemperature: Double
    
    var body: some View {
        HStack {

            VStack {
                Text(formattedValue(minTemperature))
                    .foregroundColor(.appText)
                    .font(.appBodyBold)
                Text("min")
                    .foregroundColor(.appText)
                    .font(.appBody)
            }

            Spacer()

            VStack {
                Text(formattedValue(currentTemperature))
                    .foregroundColor(.appText)
                    .font(.appBodyBold)
                Text("current")
                    .foregroundColor(.appText)
                    .font(.appBody)
            }

            Spacer()

            VStack {
                Text(formattedValue(maxTemperature))
                    .foregroundColor(.appText)
                    .font(.appBodyBold)
                Text("max")
                    .foregroundColor(.appText)
                    .font(.appBody)
            }
        }

    }
}
