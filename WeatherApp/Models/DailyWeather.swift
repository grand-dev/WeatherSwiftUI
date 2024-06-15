//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import Foundation

public struct DailyWeather: Codable {

    public var city: City
    public var list: [Weather]

    enum CodingKeys: String, CodingKey {
        case city
        case list
    }

    public init() {
        city = City(name: "Chisinau", country: "Moldova")
        list = []
    }
}
