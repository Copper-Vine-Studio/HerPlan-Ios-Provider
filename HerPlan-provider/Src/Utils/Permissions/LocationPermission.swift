//
//  LocationPermission.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class LocationService: NSObject {

    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    var lastUserLocation: CLLocation?
    var currentUserLocation: ((CLLocation) -> ())?
    var changeAuthorizationSuccess : (() -> ())?
    var isLocationFetched: Bool = false
    
    var isRemainToTakeLocationPermision: Bool {
        return (CLLocationManager.authorizationStatus() == .notDetermined || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .restricted) //Location permision popup displayed?
    }

    var isLocationPermissionGiven : Bool {
        if CLLocationManager.locationServicesEnabled() {
            if CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                return true
            }
        }
        return false
    }

    static let shared = LocationService()

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.allowsBackgroundLocationUpdates = false
        locationManager?.delegate = self
        //locationManager?.requestAlwaysAuthorization()
    }
    
    func startLocationUpdate() {
        locationManager?.startUpdatingLocation()
    }

    func stopLocationUpdate() {
        locationManager?.stopUpdatingLocation()
    }
}

//MARK:- CLLocationManagerDelegate Methods
extension LocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        isLocationFetched = false
        switch status {
            case .notDetermined:
                locationManager?.requestWhenInUseAuthorization()
            case .restricted, .denied:
                self.openPermissionPopuop()
                locationManager?.stopUpdatingLocation()
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager?.startUpdatingLocation()
                self.changeAuthorizationSuccess?()
        @unknown default: break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last
        if let userUpdatedLocation = locations.last, !isLocationFetched {
            isLocationFetched = true
            currentUserLocation?(userUpdatedLocation)
            stopLocationUpdate()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: Failed to get User current Location \(error.localizedDescription)")
        self.failedPopup()
    }
    
    func openPermissionPopuop()
    {
        guard let topViewController = UIApplication.topViewController() else {
            return
        }
        topViewController.displayAlert(title: "", message: "Work In Progress", completion: nil)
    }
    
    func failedPopup()
    {
        guard let topViewController = UIApplication.topViewController() else {
            return
        }
        topViewController.displayAlert(title: "", message: "Work In Progress", completion: nil)
    }
}

extension CLLocation {
    func fetchCityStateAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ state:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) {
            completion($0?.first?.locality, $0?.first?.isoCountryCode, $0?.first?.administrativeArea, $1)
        }
    }
}
