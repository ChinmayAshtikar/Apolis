//
//  ViewController.swift
//  MapApp
//
//  Created by Chinmay Ashtikar on 6/24/24.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var mapView = MKMapView()
    private var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        mapView.delegate = self
        mapView.showsUserLocation = true
        self.view.addSubview(mapView)
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        if currentLocation == nil {
            currentLocation = location
            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
            
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            pin.title = "Current Location"
            mapView.addAnnotation(pin)
        }
    }
}
