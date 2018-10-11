//
//  MyMapViewController.swift
//  Breweries
//
//  Created by Admin on 8/26/18.
//  Copyright © 2018 MobileAppsCompany. All rights reserved.
//


import UIKit
import SwiftyJSON
import Kingfisher
import MapKit
import CoreLocation


class MyMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    let locationManager = CLLocationManager()
    var pointAnnotation: CustomMKAnnotation!
    var pinAnnotationView: MKPinAnnotationView!
    var beerBrew = [JsonModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if CLLocationManager.locationServicesEnabled() == true {
            
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined {
                
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            
        } else {
            print("PLease turn on location services or GPS")
        }

        //Mark: - Authorization
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
        myMap.delegate = self
        myMap.mapType = MKMapType.standard
        myMap.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = CLLocationCoordinate2D(latitude: 33.760882000869195, longitude: -84.39697265625)
        let center = location
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        myMap.setRegion(region, animated: true)
        
        pointAnnotation = CustomMKAnnotation()
        pointAnnotation.pinCustomImageName = "dividerBar"
        pointAnnotation.coordinate = location
        pointAnnotation.title = "TestBEER"
        pointAnnotation.subtitle = "microBrew"
        
        pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: "pin")
        myMap.addAnnotation(pinAnnotationView.annotation!)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
    
    //MARK: - Custom Annotation
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        let customPointAnnotation = annotation as! CustomMKAnnotation
        annotationView?.image = UIImage(named: customPointAnnotation.pinCustomImageName)
        
        return annotationView
    }
    
    
}
