//
//  MapUIView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import MapKit

struct MapUIView: View {
    
    var gr: GeometryProxy
    
    @State var pharmacies: [Pharmacy] = [Pharmacy]()
    
    @Binding var coordinate: CLLocationCoordinate2D
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapView(pharmacies: self.pharmacies, coordinate: self.coordinate)
                .onTapGesture {
                DataService.instance.getNearByPharmacies { (success) in
                    if success {
                        self.pharmacies = []
                        self.pharmacies = DataService.instance.pharmacies
                    }
                }
                    
            }
            
            
        }.edgesIgnoringSafeArea(.all)
        .onAppear {
            if Double(self.coordinate.latitude) == Double(0) && Double(self.coordinate.longitude) == Double(0){
                DataService.instance.getNearByPharmacies { (done) in
                    if done {
                        self.pharmacies = []
                        self.pharmacies = DataService.instance.pharmacies
                    }
                }
            }
        }
        
    }
}

struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            MapUIView(gr: gr, coordinate: .constant(CLLocationCoordinate2D(latitude: 0, longitude: 0)))
        }
    }
}
