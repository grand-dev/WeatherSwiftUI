//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 10.10.2022.
//

import SwiftUI

@main
struct WeatherApp: App {

    var body: some Scene {
        WindowGroup {
            WeatherView(weatherVM: WeatherViewModel())
        }
    }
}
