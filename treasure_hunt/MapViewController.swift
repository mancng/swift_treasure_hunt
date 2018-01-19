//
//  ViewController.swift
//  treasure_hunt
//
//  Created by Rachel Ng on 1/18/18.
//  Copyright © 2018 Rachel Ng. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AudioToolbox

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var myMap: MKMapView!
    
    @IBOutlet var digButton: UIButton!

    var soundManager = SoundManager()

    @IBAction func digButtonPressed(_ sender: UIButton) {
 
        //GO TO Result View
        performSegue(withIdentifier: "gotWinner", sender: sender)
        
        //GO TO HINT View
        performSegue(withIdentifier: "needHint", sender: sender)
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let hintViewController = segue.destination as! HintViewController
        let message = "You are too far away!"
        hintViewController.message = message
    }
    
    //MARK: Creating the instance of the CLLocationManagerClass
    let locManager = CLLocationManager()
    
    //Get user location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    //MARK: if the locManager fails
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("failed", error)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: LocationManager Setup
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestAlwaysAuthorization()
        locManager.startUpdatingLocation()
        
        
        //MARK: Cam Setup
        myMap.delegate = self
        let cam = MKMapCamera()
        cam.altitude = 100
        myMap.camera = cam
        myMap.centerCoordinate = CLLocationCoordinate2DMake(34.1810714596047, -118.309393896266)
    
//        myMap.setRegion(region, animated: true)
//        myMap.showsUserLocation = true
        
        //Pin the map
//        var pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(33.812092, -117.918974)
//        var objectAnnotation = MKPointAnnotation()
//        objectAnnotation.coordinate = pinLocation
//        objectAnnotation.title = "ME"
//        self.myMap.addAnnotation(objectAnnotation)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        soundManager.playSound(.rain)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

