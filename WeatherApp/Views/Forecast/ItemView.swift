//
//  ItemView.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI

struct ItemView: View {

    var weather: Weather

    var body: some View {
        HStack {
            Text(timeFormattedDateTime(weather.dt))
                .foregroundColor(.appText)
                .font(.appBody)

            Spacer()

            icon(for: weather.type)

            Text(formattedValue(weather.main.temp))
                .foregroundColor(.appText)
                .font(.appBodyBold)
                .frame(width: 80.0, alignment: .trailing)
        }
    }
}
