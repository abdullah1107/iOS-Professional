//
//  ViewController.swift
//  map-kit-tutorial-1
//
//  Created by Code Pro on 1/28/18.
//  Copyright © 2018 Code Pro. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?
    
    private var destinations: [MKPointAnnotation] = []
    private var currentRoute: MKRoute?

    @IBOutlet weak var mapView: MKMapView!
    
//    override func viewDidLoad() {
//           super.viewDidLoad()
//
//           let request = MKDirectionsRequest()
//
//           // Set request parameters
//           request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.7127, longitude: -74.0059), addressDictionary: nil))
//           request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.6761, longitude: -73.9521), addressDictionary: nil))
//           request.requestsAlternateRoutes = true
//
//           // Set tranport type parameter (anything other than .Transit works)
//           request.transportType = .transit
//
//           let directions = MKDirections(request: request)
//
//           directions.calculateDirectionsWithCompletionHandler { response, error in
//               print(response)
//
//               guard let routes = response?.routes else {
//                   print(error?.description)
//                   return
//               }
//
//               // Prints step-by-step directions
//               for r in routes {
//                   print("New route")
//                   for step in r.steps {
//                       print("  " + step.instructions)
//                   }
//               }
//           }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configureLocationServices()
        mapView.delegate = self
        temp()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    private func configureLocationServices() {
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: locationManager)
        }
        
        
    
        
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//
//            print("Not being called")
//            let renderer = MKPolylineRenderer(overlay: overlay)
//
//            return renderer
}
        func temp() ->MKOverlayRenderer {
            
            
            print("hello.......")
              guard let currentRoute = currentRoute else {
                  return MKOverlayRenderer()
              }
              
              let polyLineRenderer = MKPolylineRenderer(polyline: currentRoute.polyline)
              polyLineRenderer.strokeColor = UIColor.systemRed
              polyLineRenderer.lineWidth = 5
              
              return polyLineRenderer
          }
    //}
    
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, 10000, 10000)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    private func addAnnotations() {
        
        let appleParkAnnotation = MKPointAnnotation()
        appleParkAnnotation.title = "Apple Park"
        appleParkAnnotation.coordinate = CLLocationCoordinate2D(latitude: 37.332072300 , longitude:-122.011138100)
        
        let ortegaParkAnnotation = MKPointAnnotation()
        ortegaParkAnnotation.title = "Ortega Park"
        ortegaParkAnnotation.coordinate = CLLocationCoordinate2D(latitude:    37.342226 , longitude: -122.025617)
        
        destinations.append(appleParkAnnotation)
        destinations.append(ortegaParkAnnotation)
        
        mapView.addAnnotation(appleParkAnnotation)
        mapView.addAnnotation(ortegaParkAnnotation)
       
    }
    
    private func constructRoute(userLocation: CLLocationCoordinate2D) {
        
        let directionsRequest = MKDirectionsRequest()
        directionsRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: destinations[0].coordinate))
        directionsRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinations[1].coordinate))
        directionsRequest.requestsAlternateRoutes = true
        directionsRequest.transportType = .transit
        
        let directions = MKDirections(request: directionsRequest)
        
        directions.calculate { [weak self] (directionsResponse, error) in
            
            guard let strongSelf = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
            } else if let response = directionsResponse, response.routes.count > 0 {
                
                strongSelf.currentRoute = response.routes[0]
                strongSelf.mapView.add(response.routes[0].polyline)
                strongSelf.mapView.setVisibleMapRect(response.routes[0].polyline.boundingMapRect, animated: true)
            }
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get latest location")
        
        guard let latestLocation = locations.first else { return }
        
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            addAnnotations()
            constructRoute(userLocation: destinations[0].coordinate)
        }
    
        currentCoordinate = destinations[0].coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       print("The status changed")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: manager)
        }
    }
}

//extension ViewController: MKMapViewDelegate {
    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//
//        guard let currentRoute = currentRoute else {
//            return MKOverlayRenderer()
//        }
//
//        let polyLineRenderer = MKPolylineRenderer(polyline: currentRoute.polyline)
//        polyLineRenderer.strokeColor = UIColor.systemRed
//        polyLineRenderer.lineWidth = 5
//
//        return polyLineRenderer
//    }
    
   
    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//      let renderer = MKPolylineRenderer(overlay: overlay)
//      if (overlay is MKPolyline) {
//        renderer.strokeColor = .red
//        renderer.lineWidth = 5.0
//        renderer.alpha = 1.0 // changed 0.8 to 1.0, now it works
//      }
//        return renderer
//    }
    
   // func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
//
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
//        }
//
//        if let title = annotation.title, title == "Apple Park" {
//            annotationView?.image = UIImage(named: "saucer")
//        } else if let title = annotation.title, title == "Ortega Park" {
//            annotationView?.image = UIImage(named: "tree")
//        } else if annotation === mapView.userLocation {
//            annotationView?.image = UIImage(named: "car")
//        }
//
//        annotationView?.canShowCallout = true
//
//        return annotationView
//    }
//
//    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        print("The annotation was selected: \(String(describing: view.annotation?.title))")
//    }
//}

