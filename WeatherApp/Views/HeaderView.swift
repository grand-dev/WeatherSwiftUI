//
//  HeaderView.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI

struct HeaderView: View {

    var weatherType: WeatherType
    var cityName: String

    var body: some View {
        ZStack {
            backgroundImage(for: weatherType)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(cityName)
                .foregroundColor(.appText)
                .font(.appTitle)
        }
    }
}
