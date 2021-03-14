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
    @ObservedObject var locationManager = LocationManager()
    @State var pharmacies: [Pharmacy] = [Pharmacy]()
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    private func getNearByPharmacies(){
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "drug store"
        
        let search = MKLocalSearch(request: request)
        search.start { (res, err) in
            if let res = res {
                let mapItems = res.mapItems
                
                self.pharmacies = mapItems.map({
                    Pharmacy(placemark: $0.placemark)
                })
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapView(pharmacies: self.pharmacies)
                .onTapGesture {
                    self.getNearByPharmacies()
            }
            
            NavigationLink(destination: HomeView().navigationBarTitle("").navigationBarHidden(true)) {
                HStack {
                    BackBtn(gr: gr)
                    Spacer()
                    Text("Tap to refresh nearby pharmacies")
                    .foregroundColor(fontColor)
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .rounded))
                    Spacer()
                    Spacer()
                }.padding([.leading, .trailing])
                
            }.padding(.top, gr.size.height*0.08)
        }.edgesIgnoringSafeArea(.all)
        .onAppear {
            self.getNearByPharmacies()
        }
        
    }
}

struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            MapUIView(gr: gr)
        }
    }
}
