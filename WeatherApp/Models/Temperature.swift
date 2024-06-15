//
//  Temperature.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import Foundation

public struct Temperature: Codable, Equatable {
    public var temp: Double
    public var temp_min: Double
    public var temp_max: Double

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
    }
}
