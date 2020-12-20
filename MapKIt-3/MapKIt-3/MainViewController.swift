//
//  ViewController.swift
//  MapKIt-3
//
//  Created by Muhammad Abdullah Al Mamun on 14/12/20.
//

import UIKit
import MapKit

class MainViewController: UIViewController{
    
    private let locationManager = CLLocationManager()
    private var currentCoordinate:CLLocationCoordinate2D?
    private var destination:[MKPointAnnotation] = []
    private var currentRoute: MKRoute?
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        mapView.delegate = self
    }
    
    // viewDidLoad() -> checkLocationServices()
    func checkLocationServices(){
        
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    
    //checkLocationServices() -> setupLocationManager()
   private func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
   // checkLocationAuthorization() - > beginLocationUpdate()
    private func beginLocationUpdate(locationManager:CLLocationManager){
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate:CLLocationCoordinate2D){
        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(zoomRegion, animated: true)
    }
 
    
}



extension MainViewController{
    
    //MARK:- add Anotation
    private func anotations(){
        let appleparkAnotation = MKPointAnnotation()
        appleparkAnotation.title = "Apple Park"
        
        appleparkAnotation.coordinate = CLLocationCoordinate2D(latitude: 37.332072300 , longitude:-122.011138100)
        
        let ortegaParkAnnotation = MKPointAnnotation()
        ortegaParkAnnotation.title = "Ortega Park"
        ortegaParkAnnotation.coordinate = CLLocationCoordinate2D(latitude:    37.342226 , longitude: -122.025617)
        
        destination.append(appleparkAnotation)
        destination.append(ortegaParkAnnotation)
        
        mapView.addAnnotation(appleparkAnotation)
        mapView.addAnnotation(ortegaParkAnnotation)
    }
    
    //MARK:-Construct Route
    
    private func constructRoute(userlocation:CLLocationCoordinate2D){
        
        let directionRequest = MKDirections.Request() //change in swift 5
        
        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: userlocation))
        
        directionRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination[1].coordinate))
        
        directionRequest.requestsAlternateRoutes = true
        
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate { [weak self] (directionsResponse, error) in
            
            guard let strongSelf = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
            } else if let response = directionsResponse, response.routes.count > 0 {
                
                strongSelf.currentRoute = response.routes[0]
                strongSelf.mapView.addOverlay(response.routes[0].polyline)
                strongSelf.mapView.setVisibleMapRect(response.routes[0].polyline.boundingMapRect, animated: true)
            }
        }
    }
    
}

extension MainViewController{
    
    // MARK:- login authorization
    
    //checkLocationServices() -> checkLocationAuthorization()
    
    func checkLocationAuthorization(){
        //let locationManagerstatus = locationManager.authorizationStatus
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            //mapView.showsUserLocation = true
            beginLocationUpdate(locationManager: locationManager)
            //centerViewOnUserLocation()
            //locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
           // mapView.showsUserLocation = true
            beginLocationUpdate(locationManager: locationManager)
            //locationManager.startUpdatingLocation()
            break
            
        default:
            print("nothing update")
            break
        }
        
    }
}

extension MainViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get latest location")
        
        guard let latestLocation = locations.first else { return }
        
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            anotations()
            constructRoute(userlocation: destination[0].coordinate)
        }
        
        currentCoordinate = latestLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("The status changed")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdate(locationManager: manager)
        }
    }
}

extension MainViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        guard let currentRoute = currentRoute else {
            return MKOverlayRenderer()
        }
        
        let polyLineRenderer = MKPolylineRenderer(polyline: currentRoute.polyline)
        polyLineRenderer.strokeColor = UIColor.orange
        polyLineRenderer.lineWidth = 5
        
        return polyLineRenderer
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
        if let title = annotation.title, title == "Apple Park" {
            annotationView?.image = UIImage(named: "saucer")
        } else if let title = annotation.title, title == "Ortega Park" {
            annotationView?.image = UIImage(named: "tree")
        } else if annotation === mapView.userLocation {
            annotationView?.image = UIImage(named: "car")
        }
        
        annotationView?.canShowCallout = true
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("The annotation was selected: \(String(describing: view.annotation?.title))")
    }
}
