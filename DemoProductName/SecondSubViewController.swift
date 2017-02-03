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
    let locationManager = CLLocationManager()
    var location = CLLocation()
//    let getLocationBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        self.title = "sub2NC"
        let leftBtn = UIBarButtonItem(title: place, style: .plain, target: self, action: #selector(getLocation))
        self.navigationItem.leftBarButtonItem = leftBtn
        
//        getLocationBtn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        getLocationBtn.addTarget(self, action: #selector(clickGetLocationBtn(_:)), for: .touchUpInside)
//        getLocationBtn.backgroundColor = UIColor.red
//        getLocationBtn.setTitle(place, for: .normal)
//        self.view.addSubview(getLocationBtn)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem?.title = place
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func clickGetLocationBtn(_ sender: UIButton) {
        let getLocationVC = GetLocationViewController()
        let getLocationNC = UINavigationController(rootViewController: getLocationVC)
  
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks: [CLPlacemark]?, error: Error?) in
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
                place = (placemark?.locality)!
                self.present(getLocationNC, animated: true) {
                    print("present")
                }
            } else if error == nil {
                print("Found no placemarks.")
            } else {
                print("error is \(error)")
            }
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last!
    }
    
    func getLocation() {
        let getLocationVC = GetLocationViewController()
        let getLocationNC = UINavigationController(rootViewController: getLocationVC)
        self.present(getLocationNC, animated: true) {
            print("present getLocationNC")
        }
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
