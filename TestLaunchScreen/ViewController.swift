//
//  ViewController.swift
//  TestLaunchScreen
//
//  Created by punyawee  on 14/1/2562 BE.
//  Copyright © 2562 Punyugi. All rights reserved.
//

import UIKit
import CoreLocation

struct AquariumLocation {
    var name: String
    var latitude: ClosedRange<Float>
    var longtitude: ClosedRange<Float>
}

class ViewController: UIViewController {
    
    var button = UIButton()
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var currentAquariumLocationLbl: UILabel!
    var aquariumLocations = [
        AquariumLocation(name: "พิพิธภัณฑ์วิทยาศาสตร์ทางทะเล มหาวิทยาลัยบูรพา จังหวัดชลบุรี", latitude: 13.27...13.28, longtitude: 100.92...100.93)
    ]
    
    
    let locationManager = CLLocationManager()
    
    var currentAquarimLocation: AquariumLocation?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        testButton.alpha = 1
        testButton.isHidden = false
//        let testRange: ClosedRange = 1...3
//        print(testRange.contains(2))
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = UIColor.clear
        
        
//        button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        button.setBackgroundImage(UIImage(named: "historybtn3"), for: .normal)
//
//        navigationItem.rightBarButtonItem?.customView = button
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
  
    }

}


extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if
            CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == .authorizedAlways {
            if let currentCoordinate = locationManager.location?.coordinate {
                let currentLatitude = Float(String(format: "%.2f", currentCoordinate.latitude))
                let currentLongtitude = Float(String(format: "%.2f", currentCoordinate.longitude))
                if let la = currentLatitude, let long = currentLongtitude {
                    print(la, long)
                    let filtered = aquariumLocations.filter { (location) -> Bool in
                        if location.latitude.contains(la), location.longtitude.contains(long) {
                            return true
                        }
                        return false
                    }
                    if let firstFiltered = filtered.first {
                        currentAquarimLocation = firstFiltered
                        currentAquariumLocationLbl.text = currentAquarimLocation!.name
                    }
                }
            }
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//    }
    
  
}
