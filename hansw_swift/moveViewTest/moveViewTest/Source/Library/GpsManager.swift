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
    
    func GetGps() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //  권한요청
        locationManager.startUpdatingLocation()
        
        //장치에서 위치 서비스를 사용할 수 있는지 여부를 나타내는 Boolean 값을 반환한다.
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }else{
            print("오..이런..gps.")
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location else{
            return
        }
        let cor = location.coordinate
        printAddressBasedOnGPS(lati: cor.latitude , longi: cor.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    

}

// MARK: 로깅 부분
extension GpsManager{
    func printAddressBasedOnGPS(lati:CLLocationDegrees, longi:CLLocationDegrees){
        let findLocation = CLLocation(latitude: lati, longitude: longi )
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr") //원하는 언어의 나라 코드를 넣어주시면 됩니다.
        
        if #available(iOS 11.0, *) {
            geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale, completionHandler: {(placemarks, error) in
                
                
                if let address: [CLPlacemark] = placemarks {
                    
                    if let name: String = address.last?.name {
                        print(name , lati, address )
                        print("\(name) :  gps\(lati)")
                    }
                    
                    // refered to CLPlacemark 객체:
                    // po address.last?.administrativeArea 경기도
                    // po address.last?.locality 성남시
                    // po address.last?.name     성남대로343번길
                    // po address.last?.country  대한민국
                    
                    
                } })
        } else {
            // Fallback on earlier versions
        }
         
    }
}
