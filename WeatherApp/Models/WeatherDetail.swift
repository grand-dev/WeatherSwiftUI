//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import Foundation

public struct WeatherDetail: Codable, Equatable {

    public let main: String

    enum CodingKeys: String, CodingKey {
        case main
    }
}
