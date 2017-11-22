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
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.activityType = .automotiveNavigation
        locationManager.desiredAccuracy = 1
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = true
        //locationManager.showsBackgroundLocationIndicator = true
        locationManager.delegate = self
        
        
        locationManager.requestAlwaysAuthorization()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        let now = Date()
        UserDefaults.standard.set(now, forKey: "openedTime")
    }
    
    @objc func stopUpdates(){
        self.locationManager.stopUpdatingLocation()
        NSLog("locationmanager: didStopUpdates")
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        NSLog("locationmanager: didPauseUpdates")
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        NSLog("locationmanager: didResumeUpdates")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        NSLog("locationmanager: didUpdateLocations")
        let now = Date()
        let latest = UserDefaults.standard.object(forKey: "openedTime")
//        if now.timeIntervalSince(latest as! Date) > 15.0 {
//            //RESULT: it stops location update while at background
//            self.locationManager.stopUpdatingLocation()
//            self.locationManager.allowsBackgroundLocationUpdates = false
//            NSLog("locationmanager: didStopUpdate")
//        }
//
    }
    

    
    
}

