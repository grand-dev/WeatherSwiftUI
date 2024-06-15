//
//  API+Extensions.swift
//
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import Foundation

extension API {

    public static func getURLFor(lat: Double, lon: Double, type: CallType) -> URL? {
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/\(type.rawValue)")

        components?.queryItems = [
            URLQueryItem(name: "appid", value: key),
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lon", value: "\(lon)"),
            URLQueryItem(name: "units", value: "metric"),
        ]

        // additional query item for forecast request for 3 days
        if type == .forecast {
            components?.queryItems?.append(URLQueryItem(name: "cnt", value: "24"))
        }

        return components?.url
    }
}

public enum CallType: String {
    case weather
    case forecast
}
