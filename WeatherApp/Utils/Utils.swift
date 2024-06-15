//
//  Utils.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import Foundation
import SwiftUI
import Resources

// MARK: - Formatting

private let dateFormatter = DateFormatter()

func formattedValue(_ value: Double) -> String {
    return "\(Int(value))°C"
}

func formattedDate(_ date: Date) -> String {
    dateFormatter.dateFormat = "EEEE, MMMM d"
    return dateFormatter.string(from: date)
}

func timeFormattedDateTime(_ dateTime: Double) -> String {
    let date = Date(timeIntervalSince1970: dateTime)
    return timeFormattedDate(date)
}

func timeFormattedDate(_ date: Date) -> String {
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: date)
}

func groupWeatherByDay(_ dailyWeather: [Weather]) -> [Date: [Weather]] {
    return Dictionary(grouping: dailyWeather) { weather in
        let components = Calendar.current.dateComponents( [.day, .month, .year],
            from: Date(timeIntervalSince1970: weather.dt))
        return Calendar.current.date(from: components) ?? .now
    }
}

// MARK: - Assets helpers

func backgroundImage(for weatherType: WeatherType) -> Image {
    switch weatherType {
    case .sunny:
        return .backgroundSunny
    case .cloudy:
        return .backgroundCloudy
    case .rainy:
        return .backgroundRainy
    }
}

func icon(for weatherType: WeatherType) -> Image {
    switch weatherType {
    case .sunny:
        return .iconSunny
    case .cloudy:
        return .iconCloudy
    case .rainy:
        return .iconRainy
    }
}

func color(for weatherType: WeatherType) -> Color {
    switch weatherType {
    case .sunny:
        return .sunny
    case .cloudy:
        return .cloudy
    case .rainy:
        return .rainy
    }
}
