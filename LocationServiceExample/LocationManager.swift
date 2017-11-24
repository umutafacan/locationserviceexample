//
//  LocationManager.swift
//  LocationServiceExample
//
//  Created by umut on 11/23/17.
//  Copyright © 2017 umut. All rights reserved.
//

import Foundation
import CoreLocation

final class LocationManager:NSObject,CLLocationManagerDelegate{
    
    var locationManager:CLLocationManager = CLLocationManager()
    // Can't init is singleton
    private override init() { }
    // MARK: Shared Instance
    static let shared = LocationManager()

    func configureLocationManager(){
        locationManager.activityType = .automotiveNavigation
        locationManager.desiredAccuracy = 0.0
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    func startUpdate(){
        
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        
    }
    
    func requestLocation(){
        locationManager.requestLocation()
    }
    
    
    @objc func stopUpdates(){
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        LocationNetwork.locationUpdate()
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }
    
    
    
}
