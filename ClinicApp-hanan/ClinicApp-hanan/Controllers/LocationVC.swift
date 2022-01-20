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
        view.backgroundColor = UIColor(named: "bgColor")
        setMapConstraints()
        configureMap()
    }
    
    func configureMap() {
         let center = CLLocationCoordinate2D(latitude: 18.222442509549063, longitude: 42.51460111562375)
         let span = MKCoordinateSpan(latitudeDelta: 0.175, longitudeDelta: 0.175)
         let region = MKCoordinateRegion(center: center, span: span)
          mapView.setRegion(region, animated: true)
          //self.mapView()
       }

    func setMapConstraints() {
        view.addSubview(mapView)


        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true


        let DenteraLocation = MKPointAnnotation()
        DenteraLocation.title = NSLocalizedString("عيادة دنتيرا لطب الأسنان", comment: "")
        DenteraLocation.coordinate = CLLocationCoordinate2D(latitude: 18.2194944, longitude: 42.5123316)

        mapView.addAnnotation(DenteraLocation)

        let JoyaLocation = MKPointAnnotation()
        JoyaLocation.title = NSLocalizedString("عيادة جويا لطب الأسنان", comment: "")
        JoyaLocation.coordinate = CLLocationCoordinate2D(latitude: 18.2497107, longitude: 42.4584669)

        mapView.addAnnotation(JoyaLocation)

        let MadarLocation = MKPointAnnotation()
        MadarLocation.title = NSLocalizedString("عيادة المدار لطب الأسنان", comment: "")
        MadarLocation.coordinate = CLLocationCoordinate2D(latitude: 18.2077484, longitude: 42.49057)

        mapView.addAnnotation(MadarLocation)

        let DrSultanLocation = MKPointAnnotation()
        DrSultanLocation.title = NSLocalizedString("عيادة برو كلينيك لطب الأسنان", comment: "")
        DrSultanLocation.coordinate = CLLocationCoordinate2D(latitude: 18.2128453, longitude: 42.529654)

        mapView.addAnnotation(DrSultanLocation)

    }
    }

