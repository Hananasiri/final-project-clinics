//
//  LocationVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 03/05/1443 AH.
//

import UIKit
import MapKit


class LocationVC: UIViewController {


    let  mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setMapConstraints()
    }

    func setMapConstraints() {
        view.addSubview(mapView)


        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true


        let DenteraLocation = MKPointAnnotation()
        DenteraLocation.title = "عيادة دنتيرا"
        DenteraLocation.coordinate = CLLocationCoordinate2D(latitude: 18.2194944, longitude: 42.5123316)

        mapView.addAnnotation(DenteraLocation)

        let JoyaLocation = MKPointAnnotation()
        JoyaLocation.title = "عيادة جويا "
        JoyaLocation.coordinate = CLLocationCoordinate2D(latitude: 18.2497107, longitude: 42.4584669)

        mapView.addAnnotation(JoyaLocation)

        let MadarLocation = MKPointAnnotation()
        MadarLocation.title = "عيادة المدار الطبي"
        MadarLocation.coordinate = CLLocationCoordinate2D(latitude: 18.2077484, longitude: 42.49057)

        mapView.addAnnotation(MadarLocation)

        let DrSultanLocation = MKPointAnnotation()
        DrSultanLocation.title = "عيادة برو كلينيك"
        DrSultanLocation.coordinate = CLLocationCoordinate2D(latitude: 18.2128453, longitude: 42.529654)

        mapView.addAnnotation(DrSultanLocation)

    }
}

