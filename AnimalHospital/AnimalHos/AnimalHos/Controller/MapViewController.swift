//
//  MapViewController.swift
//  AnimalHos
//
//  Created by 유원근 on 2022/11/19.
//

import Foundation
import UIKit
import MapKit
//import GoogleMaps


class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var myMap: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        //myMap.showsUserLocation
    }
}
// MARK: - 카카오 맵도 x86_arm64 오류 하..
/*
    var mapView : MTMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MTMapView(frame: self.view.bounds)
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
        }
  
        
        
// MARK: - 구글 맵 m1 오류
      /*  // 구글 지도 표시하기
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate 37.566508,126.977945 at zoom level 16.
        let camera = GMSCameraPosition.camera(withLatitude: 37.566508, longitude: 126.977945, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.566508, longitude: 126.977945)
        marker.title = "Sydney"
        marker.snippet = "South Korea"
        marker.map = mapView
       */
    }
}*/
