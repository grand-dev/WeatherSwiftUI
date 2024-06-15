//
//  CityViewViewModel.swift
//  WeatherApp
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import SwiftUI
import SBLocationManager
import Networking

public class WeatherViewModel: ObservableObject {

    @Published var weather = Weather()
    @Published var dailyWeather = DailyWeather()
    @Published var isLoading: Bool = true
    @Published var errorReason: String?
    
    let locationManager: LocationManager

    init() {
        locationManager = LocationManagerImpl()
    }

    func handleOnAppearView() {
        switch locationManager.manager.authorizationStatus {
        case .notDetermined:
            locationManager.requestPermissions { isGranted in
                guard isGranted else {
                    self.isLoading = false
                    print(LocationManagerError.permissionNotGranted)
                    self.errorReason = "\(LocationManagerError.permissionNotGranted.rawValue): Please provide location permission in settings."
                    return
                }
                self.getLocation()
            }
        case .authorizedAlways, .authorizedWhenInUse:
            getLocation()
        case .denied:
            isLoading = false
            print(LocationManagerError.permissionDenied)
            errorReason = "\(LocationManagerError.permissionDenied.rawValue): Please provide location permission in settings."
        case .restricted:
            isLoading = false
            print(LocationManagerError.permissionRestricted)
            errorReason = "\(LocationManagerError.permissionRestricted.rawValue): Please provide location permission in settings."
        default:
            preconditionFailure("Unknown location authorization status.")
        }
    }

    private func getLocation() {
        locationManager.fetchLocation { coordinates, error in
            if let error = error {
                print(error)
            }

            if let coord = coordinates {
                self.getWeather(latitude: coord.x, longitude: coord.y)
                self.getDailyWeather(latitude: coord.x, longitude: coord.y)
            }
        }
    }

    private func getWeather(latitude: Double, longitude: Double) {
        guard let url = API.getURLFor(lat: latitude, lon: longitude, type: .weather) else {
            isLoading = false
            errorReason = "Network error occured."
            return
        }
        
        NetworkManager<Weather>.fetch(for: url) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.weather = response
                }
            case .failure(let err):
                print("Check your API_KEY")
                print("Weather request failed with: \(err.localizedDescription)")
                DispatchQueue.main.async {
                    self.errorReason = "Network error occured."
                }
            }
        }
    }

    private func getDailyWeather(latitude: Double, longitude: Double) {
        guard let url = API.getURLFor(lat: latitude, lon: longitude, type: .forecast) else {
            isLoading = false
            errorReason = "Network error occured."
            return
        }

        NetworkManager<DailyWeather>.fetch(for: url) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.dailyWeather = response
                }
            case .failure(let err):
                print("Check your API_KEY")
                print("Forecast request failed with: \(err.localizedDescription)")
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorReason = "Network error occured."
                }
            }
        }
    }
}
