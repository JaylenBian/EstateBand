//
//  MeViewController.swift
//  EstateBand
//
//  Created by Minecode on 2017/6/27.
//  Copyright © 2017年 org.minecode. All rights reserved.
//

import UIKit
import MapKit

class MeViewController: UIViewController {
    
    // 控件
    @IBOutlet weak var mapKit: MKMapView!
    @IBOutlet weak var safeLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mapKit.mapType = .standard
        let latDelta = 0.002
        let longDelta = 0.002
        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let locationManager:CLLocationManager = CLLocationManager()
//        var center = locationManager.location?.coordinate
        let center = CLLocationCoordinate2D(latitude: 29.596266757471625, longitude: 106.29760086536407)
        let currentRegion: MKCoordinateRegion = MKCoordinateRegion(center: center, span: currentLocationSpan)
        self.mapKit.setRegion(currentRegion, animated: true)
        
        var objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = CLLocation(latitude: (center.latitude)+0.000010,
                                                 longitude: (center.longitude)+0.000009).coordinate
        objectAnnotation.title = "Danger Zone"
        objectAnnotation.subtitle = "Tag by Security Guard NO.2"
        self.mapKit.addAnnotation(objectAnnotation)
        objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = CLLocation(latitude: (center.latitude)-0.00013,
                                                 longitude: (center.longitude)-0.00019).coordinate
        objectAnnotation.title = "Danger Zone"
        objectAnnotation.subtitle = "Tag by Security Guard NO.1"
        self.mapKit.addAnnotation(objectAnnotation)
        objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = CLLocation(latitude: (center.latitude)+0.00033,
                                                 longitude: (center.longitude)-0.00029).coordinate
        objectAnnotation.title = "Danger Zone"
        objectAnnotation.subtitle = "Tag by Security Guard NO.1"
        self.mapKit.addAnnotation(objectAnnotation)
    }

    
    @IBAction func alertAction(_ sender: UIButton) {
        
        safeLabel.textColor = UIColor.red
        safeLabel.text = "Danger"
        
        msgLabel.text = "You are in dangerous zone!"
        
        let alert = UIAlertController(title: "Warning", message: "You are in dangerous area", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
