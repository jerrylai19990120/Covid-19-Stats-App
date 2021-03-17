//
//  DestinationPin.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-17.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import MapKit

class DestinationPin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    
    init(_ coord: CLLocationCoordinate2D) {
        self.coordinate = coord
    }
    
}
