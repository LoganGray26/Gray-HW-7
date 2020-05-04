//
//  GPSViewController.swift
//  Gray HW #7
//
//  Created by logan gray on 5/3/20.
//  Copyright © 2020 logan gray. All rights reserved.
//


import UIKit
import CoreLocation

                                        // Dont forget to add this to your class
class GPSViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    

    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    // Myrtle Beach
    let myrtleLatitude: CLLocationDegrees = 33.6991
    let myrtleLongitude: CLLocationDegrees = -78.8867

    

    
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        // horizontal accuracy less than than 0 means failure at gps level
        if newLocation.horizontalAccuracy >= 0 {
            
            
            let beach:CLLocation = CLLocation(latitude: myrtleLatitude,longitude: myrtleLongitude)

            let delta:CLLocationDistance = beach.distance(from: newLocation)
            
            let miles: Double = (delta * 0.000621371) + 0.5 // meters to rounded miles
            
            if miles < 3 {
                // Stop updating the location
                locMan.stopUpdatingLocation()
                // Congratulate the user
                distanceLabel.text = "Enjoy\nthe beautiful Myrtle Beach!"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Myrtle Beach"
            }
            
            
        }
       
    }
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; // a mile (in meters)
        locMan.requestWhenInUseAuthorization() // verify access to gps
        locMan.startUpdatingLocation()
        startLocation = nil
    }


}
