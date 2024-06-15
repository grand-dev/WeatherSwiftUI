//
//  LocationManagerImpl.swift
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import Foundation
import CoreLocation

public class LocationManagerImpl: NSObject, LocationManager, CLLocationManagerDelegate {

    public var manager: CLLocationManager
    var permissionCallback: ((Bool) -> Void)?
    var locationCallback: ((CGPoint?, LocationManagerError?) -> Void)?

    public init(with locationManager: CLLocationManager = CLLocationManager()) {
        self.manager = locationManager

        super.init()

        self.manager.delegate = self
    }

    public func requestPermissions(callback: @escaping (Bool) -> Void) {
        manager.requestWhenInUseAuthorization()
        permissionCallback = callback
    }

    public func fetchLocation( callback: @escaping (CGPoint?, LocationManagerError?) -> Void) {
        manager.requestLocation()
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.startUpdatingLocation()
        locationCallback = callback
    }

    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .denied:
            permissionCallback?(false)
            locationCallback?(nil, .permissionDenied)
        case .authorizedAlways, .authorizedWhenInUse:
            permissionCallback?(true)
            manager.startUpdatingLocation()
        case .notDetermined:
            locationCallback?(nil, .locationRequestNotGranted)
            manager.requestWhenInUseAuthorization()
        case .restricted:
            permissionCallback?(false)
            locationCallback?(nil, .permissionRestricted)
        @unknown default:
            permissionCallback?(false)
            preconditionFailure("Unknown location authorization status.")
        }
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else {
            locationCallback?(nil, .canNotGetLocation)
            return
        }
        locationCallback?(CGPoint(x: location.latitude, y: location.longitude), nil)
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
