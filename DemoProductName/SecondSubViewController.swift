//
//  SecondSubViewController.swift
//  DemoProductName
//
//  Created by zhaofei on 2017/1/26.
//  Copyright © 2017年 organizationName. All rights reserved.
//

import UIKit
import CoreLocation

class SecondSubViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()

        
        self.navigationItem.title = "sub2NC"
        let leftBtn = UIBarButtonItem(title: userDefaults.string(forKey: keyOfSelectedPlace), style: .plain, target: self, action: #selector(getLocation))
        self.navigationItem.leftBarButtonItem = leftBtn
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        if locationPlace != selectedPlace {
            self.navigationItem.leftBarButtonItem?.title = userDefaults.string(forKey: keyOfSelectedPlace)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func getLocation() {
        let getLocationVC = GetLocationViewController()
        let getLocationNC = UINavigationController(rootViewController: getLocationVC)
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
        self.present(getLocationNC, animated: true) {
            print("present getLocationNC")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(locations.last!) { (placemarks: [CLPlacemark]?, error: Error?) in
            if (placemarks?.count)! > 0 {
                let placemark = placemarks?.first
                //                print("位置: name -- \(placemark?.name)")
                //                print("位置: thoroughfare -- \(placemark?.thoroughfare)")
                //                print("位置: subThoroughfare -- \(placemark?.subThoroughfare)")
                //                print("位置: locality -- \(placemark?.locality)")
                //                print("位置: subLocality -- \(placemark?.subLocality)")
                //                print("位置: administrativeArea -- \(placemark?.administrativeArea)")
                //                print("位置: subAdministrativeArea -- \(placemark?.subAdministrativeArea)")
                //                print("位置: postalCode -- \(placemark?.postalCode)")
                //                print("位置: isoCountryCode -- \(placemark?.isoCountryCode)")
                //                print("位置: country -- \(placemark?.country)")
                //                print("位置: inlandWater -- \(placemark?.inlandWater)")
                //                print("位置: ocean -- \(placemark?.ocean)")
                //                print("位置: areasOfInterest -- \(placemark?.areasOfInterest)")
                // 设置定位地点
                locationPlace = (placemark?.locality)!
                print(locationPlace)
            } else if error == nil {
                print("Found no placemarks.")
            } else {
                print("error is \(error)")
            }
        }
        locationManager.stopUpdatingLocation()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
