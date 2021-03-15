//
//  MapView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
    
}

struct MapView: UIViewRepresentable {
    
    let pharmacies: [Pharmacy]
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.tintColor = .blue
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateAnnotation(from: uiView)
    }
    
    private func updateAnnotation(from mapView: MKMapView){
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.pharmacies.map(PharmacyAnnotation.init)
        mapView.addAnnotations(annotations)
    }
}
