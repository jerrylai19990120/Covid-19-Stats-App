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
    
    //use to render route from location to location
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = .systemBlue
        renderer.lineWidth = 5
        return renderer
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.removeOverlays(mapView.overlays)
        DataService.instance.getRouteToPharmacy(map: mapView, destination: MKPlacemark(coordinate: view.annotation!.coordinate))
        
    }
    
    
}

struct MapView: UIViewRepresentable {
    
    let pharmacies: [Pharmacy]
    
    let coordinate: CLLocationCoordinate2D
    
    
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
        if Double(self.coordinate.latitude) != Double(0) && Double(self.coordinate.longitude) != Double(0){
            uiView.removeAnnotations(uiView.annotations)
            uiView.removeOverlays(uiView.overlays)
            DataService.instance.getRouteToPharmacy(map: uiView, destination: MKPlacemark(coordinate: self.coordinate))
            uiView.addAnnotation(DestinationPin(self.coordinate))
        } else {
            updateAnnotation(from: uiView)
        }
        
    }
    
    private func updateAnnotation(from mapView: MKMapView){
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        let annotations = self.pharmacies.map(PharmacyAnnotation.init)
        mapView.addAnnotations(annotations)
    }
    
    
    
    
}
