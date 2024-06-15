//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI

struct WeatherView: View {

    @ObservedObject var weatherVM: WeatherViewModel

    var body: some View {
        ZStack {
            
            color(for: weatherVM.weather.type)
            
            if weatherVM.isLoading {
                LoadingView()
            } else if let error = weatherVM.errorReason {
                ErrorView(
                    title: "An Error occured",
                    message: error ,
                    onRetryTap: { weatherVM.handleOnAppearView()}
                )
                .frame(alignment: .center)
                .padding(24.0)
            } else {
                VStack(spacing: 24) {
                    
                    HeaderView(weatherType: weatherVM.weather.type, cityName: weatherVM.dailyWeather.city.name)

                    ContentView(weather: weatherVM.weather)
                    
                    ListView(dailyWeather: weatherVM.dailyWeather.list)
                        .padding(.horizontal, 24)

                    Spacer()
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            weatherVM.handleOnAppearView()
        }
    }
}
