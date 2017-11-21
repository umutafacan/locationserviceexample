//
//  ViewController.swift
//  LocationServiceExample
//
//  Created by umut on 11/21/17.
//  Copyright © 2017 umut. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    var locationManager:CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.activityType = .automotiveNavigation
        locationManager.desiredAccuracy = 1
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.showsBackgroundLocationIndicator = true
        locationManager.delegate = self
        
        
        locationManager.requestAlwaysAuthorization()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.startUpdatingLocation()
    
    }
    
    

    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        print("locationmanager: didPauseUpdates")
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        print("locationmanager: didResumeUpdates")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locationmanager: didUpdateLocations")
    }
    

    
    
}

