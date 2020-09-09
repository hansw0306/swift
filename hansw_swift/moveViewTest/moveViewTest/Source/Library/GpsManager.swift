//
//  GpsManager.swift
//  moveViewTest
//
//  Created by SANGWON HAN on 2020/08/07.
//  Copyright © 2020 SANGWON HAN. All rights reserved.
//

import UIKit
import CoreLocation

class GpsManager: NSObject, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!
    var mViewCon:UIViewController!
    
    func GetGps() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //베터리에 맞게 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
        
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    
                    guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate
                        else {
                            return
                    }
                    print("locations = \(locValue.latitude) \(locValue.longitude)")
                }
            }
        }
    }

    //현재 위치를 바로 가져오는 방법
    func GetCurrentlocation()->String {
        let locValue : CLLocationCoordinate2D  = locationManager.location!.coordinate
        return "locations = \(locValue.latitude) \(locValue.longitude)"
    }

}
