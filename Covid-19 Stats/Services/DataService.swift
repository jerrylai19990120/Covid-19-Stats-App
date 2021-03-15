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
    
    //Countries stats
    var countries = [Country]()
    
    var topCountries = [Country]()
    
    //today stats
    var newActive = 0
    var newRecovered = 0
    var newDeath = 0
    
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
    
    func getRouteToPharmacy(map: MKMapView, destination: MKPlacemark){
        
        let request = MKDirections.Request()
        request.source = .forCurrentLocation()
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
          guard let route = response?.routes.first else { return }
          map.addOverlay(route.polyline)
          map.setVisibleMapRect(
            route.polyline.boundingMapRect,
            edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
            animated: true)
        }
        
    }
    
    
    func getTodayStat(completion: @escaping (_ status:Bool)->()){
        
        AF.request("\(BASE_URL)summary").responseJSON { (res) in
            if res.error == nil {
                do {
                    guard let data = res.data else {
                        completion(false)
                        return
                    }
                    guard let json = try? JSON(data: data) else {
                        completion(false)
                        return
                    }
                    
                    self.newActive = Int(json["Global"]["NewConfirmed"].stringValue) ?? 0
                    self.newRecovered = Int(json["Global"]["NewRecovered"].stringValue) ?? 0
                    self.newDeath = Int(json["Global"]["NewDeaths"].stringValue) ?? 0
                        
                    completion(true)
                    
                    
                } catch {
                    completion(false)
                    print(error.localizedDescription)
                }
            } else {
                completion(false)
            }
        }
    }
    
    func getTopCountries(completion: @escaping (_ status:Bool)->()){
        
        
    }
    
    func getAllCountries(completion: @escaping (_ status:Bool)->()){
        
        if self.countries.count != 0 {
            completion(true)
            return
        }
        
        AF.request("\(BASE_URL)summary").responseJSON { (res) in
            if res.error == nil {
                do {
                    guard let data = res.data else {
                        completion(false)
                        return
                    }
                    guard let json = try? JSON(data: data) else {
                        completion(false)
                        return
                    }
                    
                    guard let allCountries = json["Countries"].array else {
                        completion(false)
                        return
                    }
                    
                    for item in allCountries {
                        let name = item["Country"].stringValue
                        let countryCode = item["CountryCode"].stringValue
                        let totalInfected = Int(item["TotalConfirmed"].stringValue)!
                        
                        let recovered = Int(item["TotalRecovered"].stringValue)!
                        let deaths = Int(item["TotalDeaths"].stringValue)!
                        
                        let active = totalInfected - recovered - deaths
                        
                        let country = Country(name: name, countryCode: countryCode, totalInfected: totalInfected, active: active, recovered: recovered, deaths: deaths)
                        
                        self.countries.append(country)
                    
                        
                    }
                    
                    completion(true)
                    
                    
                } catch {
                    completion(false)
                    print(error.localizedDescription)
                }
            } else {
                completion(false)
            }
        }
    }
    
}
