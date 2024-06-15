//
//  LocationManager.swift
//
//  Created by Gheorghi Petis on 15.06.2024.
//

import Foundation
import CoreLocation

public protocol LocationManager {
    var manager: CLLocationManager { get }
    func requestPermissions(callback: @escaping (Bool) -> Void)
    func fetchLocation(callback: @escaping (CGPoint?, LocationManagerError?) -> Void)
}

public enum LocationManagerError: String, Equatable {
    case canNotGetLocation
    case permissionNotGranted
    case permissionDenied
    case permissionRestricted
    case locationRequestNotGranted
}
