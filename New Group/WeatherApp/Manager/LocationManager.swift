//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Fabrice Kouonang on 2025-07-08.
//

import Foundation
import CoreLocation
class LocationManager: NSObject,ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    override init() {
        super.init()
        locationManager.delegate = self
       // locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.requestWhenInUseAuthorization()
       // locationManager.startUpdatingLocation()
    }
    
    func requestLocation() {
        isLoading = true
        locationManager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location.coordinate
        isLoading = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
        isLoading = false
    }
}
