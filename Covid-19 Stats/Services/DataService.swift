//
//  DataService.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MapKit
import SwiftUI

class DataService {
    
    static let instance = DataService()
    
    var pharmacies = [Pharmacy]()
    
    @ObservedObject var locationManager = LocationManager()
    
    func getNearByPharmacies(completion: @escaping (_ status:Bool)->()){
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "drug store"
        
        let search = MKLocalSearch(request: request)
        search.start { (res, err) in
            if let res = res {
                let mapItems = res.mapItems
                
                self.pharmacies = mapItems.map({
                    Pharmacy(locationManager: self.locationManager, placemark: $0.placemark)
                })
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
