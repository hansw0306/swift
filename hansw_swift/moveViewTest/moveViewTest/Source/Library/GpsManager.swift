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
        //베터리에 맞게 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //GPS 사용여부 체크
        if CLLocationManager.locationServicesEnabled()
        {
            
            let status: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
            if status == CLAuthorizationStatus.notDetermined
            {
                //권한요청
                locationManager.requestAlwaysAuthorization()
                //locationManager.requestWhenInUseAuthorization()
            }
            else
            {
                let coor = locationManager.location?.coordinate
                let latitude = coor?.latitude
                let longitude = coor?.longitude
                print("위도: \(String(describing: latitude)) 경도 : \(String(describing: longitude))")
            }
        }
        else {
            
            print("locationServices disenabled")
        }
        //위치 업데이트
        locationManager.startUpdatingLocation()
        
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
