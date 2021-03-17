//
//  HomeView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-11.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct HomeView: View {
    
    @State var selection = 0
    
    @State var countries = [Country(name: "Unknown", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)]
    
    @State var topCountries = [Country(name: "Unknown", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)]
    
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var body: some View {
        NavigationView {
            GeometryReader { gr in
                
                ZStack {
                    if self.selection == 0 {
                        MainView(gr: gr, topCountries: self.$topCountries, countries: self.$countries)
                            .offset(y: -gr.size.height*0.14)
                            .onAppear {
                                
                        }
                            
                    }
                    
                    if self.selection == 1 {
                        CountriesView(gr: gr, countries: self.$countries)
                            .offset(y: -gr.size.height*0.14)
                    }
                    
                    if self.selection == 2 {
                        SearchView(gr: gr)
                            .offset(y: -gr.size.height*0.14)
                    }
                    VStack {
                        Spacer()
                        CustomTabBar(gr: gr, selection: self.$selection).offset(y: gr.size.height*0.06)
                    }.frame(height: gr.size.height)
                    
                    
                }.onAppear {
                    DataService.instance.getAllCountries { (success) in
                        if success {
                            self.countries = DataService.instance.countries
                            self.topCountries = DataService.instance.topCountries
                            
                            print("hi")
                            DataService.instance.getCSVData { (success) in
                                if success {
                                     NotificationCenter.default.post(name: NOTIF_TOP_COUNTRIES_LOADED, object: nil)
                                }
                            }
                        }
                    }
                }.navigationBarTitle("")
                //zstack
                
            }//geo reader
        }.accentColor(tabColor)
        
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


