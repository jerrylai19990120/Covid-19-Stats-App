//
//  PharmacyAnnotation.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import UIKit
import MapKit

final class PharmacyAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(pharmacy: Pharmacy) {
        self.title = pharmacy.title
        self.coordinate = pharmacy.coordinate
    }
}
