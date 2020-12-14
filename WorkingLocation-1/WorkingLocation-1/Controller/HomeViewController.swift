//  HomeViewController.swift
//  WorkingLocation-1
//  Created by Muhammad Abdullah Al Mamun on 13/12/20.


import UIKit
import CoreLocation
import MapKit

class HomeViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    private var currentCoordinate:CLLocationCoordinate2D?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("inside viewDidLoad")
        
        configureLocationService()
    }
    


}

// MARK:- configureLocationService
extension HomeViewController{
    
    private func configureLocationService(){
        locationManager.delegate = self
        
        let status = locationManager.authorizationStatus
        //print(status)
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        }else if(status == .authorizedAlways || status == .authorizedWhenInUse) {
            //print("authorize")
            beginLocationUpdate(locationManager:locationManager)
        }
    }
    
// MARK:- beginLocationUpdate
    private func beginLocationUpdate(locationManager:CLLocationManager){
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D){
        let zoomReagon = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(zoomReagon, animated: true)
        
    }
}

extension HomeViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        
        print("did get latest location")
        guard let latestlocation = locations.first else {
            return
        }
        if currentCoordinate == nil{
            zoomToLatestLocation(with: latestlocation.coordinate)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        print("the status changes")
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdate(locationManager: manager)
        }
    }
}







//extension HomeViewController{
    //    override func viewWillAppear(_ animated: Bool) {
    //        print("inside veiwwillAppear")
    //    }
    //
    //    override func viewWillLayoutSubviews() {
    //        print("viewWillLayoutSubviews")
    //    }
    //
    //    override func viewDidLayoutSubviews() {
    //        print("viewDidLayoutSubviews")
    //    }
    //
    //    override func viewDidAppear(_ animated: Bool) {
    //        print("inside viewDidAppear")
    //    }
    //
    //    override func viewWillDisappear(_ animated: Bool) {
    //        print("func viewWillDisappear")
    //    }
    //
    //    override func viewDidDisappear(_ animated: Bool) {
    //        print("func viewWillDisappear")
    //    }

//}

