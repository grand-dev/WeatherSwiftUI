//
//  Weather.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import Foundation

public enum WeatherType: String {
    case sunny = "Clear"
    case cloudy = "Clouds"
    case rainy = "Rain"
}

public struct Weather: Codable, Equatable {
    public var dt: Double
    public var main: Temperature
    public var weather: [WeatherDetail]
    public var type: WeatherType {
        guard let type = weather.first?.main else { return .sunny}
        return WeatherType(rawValue: type) ?? .sunny
    }
    
    enum codingKeys: String, CodingKey {
        case dt
        case weather
        case temp = "main"
    }

    public init() {
        dt = 0.0
        main = Temperature(temp: 0.0, temp_min: 0.0, temp_max: 0.0)
        weather = [WeatherDetail(main: "Rain")]
    }
}
