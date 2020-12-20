//
//  ViewController.swift
//  mapdemo
//
//  Copyright © 2018 MyCompany. All rights reserved.
//

import UIKit
import MapKit



class ViewController: UIViewController,MKMapViewDelegate {
 
  var pin:AnnotationPin!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentType: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    
        
        let coordinate = CLLocationCoordinate2D(latitude: 27.173891, longitude: 78.042068)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        
        mapView.setRegion(region, animated: true)
        
        pin = AnnotationPin(title: "Taj Mahal", Subtitle: "One of the wonder of the world", coordinate: coordinate)
        mapView.addAnnotation(pin)

    }
   
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "tajPin")
        annotationView.image = UIImage(named:"taj-mahal")
        let transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        annotationView.transform = transform
        return annotationView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentHandlerType(_ sender: Any) {
        switch (segmentType.selectedSegmentIndex){
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }
    
}

