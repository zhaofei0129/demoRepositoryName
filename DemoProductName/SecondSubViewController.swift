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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let getLocationBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        getLocationBtn.addTarget(self, action: #selector(clickGetLocationBtn), for: .touchUpInside)
        getLocationBtn.backgroundColor = UIColor.red
        getLocationBtn.setTitle("获取位置", for: .normal)
        self.view.addSubview(getLocationBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func clickGetLocationBtn() {
        print("click")
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 5
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last!)
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
