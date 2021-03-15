//
//  Pharmacy.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import MapKit
import SwiftUI

struct Pharmacy: Hashable {
    
    let locationManager: LocationManager
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
    
    var distance: Double {
        locationManager.location?.distance(from: CLLocation(latitude: self.placemark.coordinate.latitude, longitude: self.placemark.coordinate.longitude)) ?? 0
    }
    
}
