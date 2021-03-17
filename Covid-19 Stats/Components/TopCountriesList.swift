//
//  TopCountriesList.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct TopCountriesList: View {
    
    var gr: GeometryProxy
    
    @Binding var topCountries: [Country]
    
    @Binding var countries: [Country]
    
    @State var cases: [[Double]] = [
        [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]
    ]
    
    let styles = [
        ChartStyle(backgroundColor:Color(red: 52/255, green: 138/255, blue: 123/255), accentColor: .white, secondGradientColor: .white, textColor: .white, legendTextColor: .white, dropShadowColor: .clear),
        ChartStyle(backgroundColor:Color(red: 255/255, green: 131/255, blue: 104/255), accentColor: .white, secondGradientColor: .white, textColor: .white, legendTextColor: .white, dropShadowColor: .clear),
        ChartStyle(backgroundColor: Color(red: 255/255, green: 211/255, blue: 98/255), accentColor: .white, secondGradientColor: .white, textColor: .white, legendTextColor: .white, dropShadowColor: .clear)
    ]
    
    @State var isReady = false
    
    var body: some View {
        VStack(spacing: 0) {
            SubHeader(gr: gr, countries: self.$countries, topCountries: self.$topCountries)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    
                    if isReady {
                        ForEach(0...9, id: \.self){
                            i in
                            NavigationLink(destination: DetailView(gr: self.gr, country: self.topCountries[i], topCountries: self.$topCountries, countries: self.$countries).navigationBarTitle("").navigationBarHidden(true)) {
                                LineChartView(data: self.cases[i], title: "\(self.countryFlag(countryCode: self.topCountries[i].countryCode)) \(self.topCountries[i].name)", legend: "\(self.topCountries[i].totalInfected)", style: self.styles[Int.random(in: 0...2)], form: ChartForm.small, dropShadow: false).frame(width: self.gr.size.width*0.4, height: self.gr.size.height*0.24)
                                    .scaleEffect(self.gr.size.width*0.00169)
                            }
                        }
                    } else {
                        LineChartView(data: [0,0,0], title: "Unknown", legend: "0", style: self.styles[Int.random(in: 0...2)], form: ChartForm.small, dropShadow: false).frame(width: self.gr.size.width*0.4, height: self.gr.size.height*0.24)
                        .scaleEffect(self.gr.size.width*0.00169)
                    }
                        
                        
                    
                    

                }
                
            }
        }.onAppear {
            NotificationCenter.default.addObserver(forName: NOTIF_TOP_COUNTRIES_LOADED, object: nil, queue: nil, using: self.topCountriesLoaded(_:))
            
        }
    }
    
    func topCountriesLoaded(_ notif: Notification){
        
        self.cases = []
        
        for country in self.topCountries {
            
            var arr = DataService.instance.dailyCases.filter({
                
                let arr2 = $0.split(separator: ",")
                
                if arr2.count != 0 {
                    let val = arr2[0].lowercased()
                    let match =  country.name.lowercased().range(of: val)
                    return match != nil ? true : false
                } else {
                    return false
                }
                
            })
            
            
            
            if arr.count != 0 {
                var items = arr[0].split(separator: ",")
                items.remove(at: 0)
                let cases = items.map({Double(String($0))!})
                self.cases.append(cases)
                
            }
            
        }
        
        self.isReady = true
        
        
        
    }
    
    func countryFlag(countryCode: String) -> String {
      let base = 127397
      var tempScalarView = String.UnicodeScalarView()
      for i in countryCode.utf16 {
        if let scalar = UnicodeScalar(base + Int(i)) {
          tempScalarView.append(scalar)
        }
      }
      return String(tempScalarView)
    }
    
}


struct TopCountriesList_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            TopCountriesList(gr: gr, topCountries: .constant([Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)]), countries: .constant([Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)]))
        }
    }
}


struct SubHeader: View {
    
    var gr: GeometryProxy
    
    @Binding var countries: [Country]
    
    @Binding var topCountries: [Country]
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    
    var body: some View {
        HStack {
            Text("Top Countries")
                .font(.system(size: gr.size.width*0.06, weight: .bold, design: .rounded))
                .foregroundColor(self.fontColor)
            Spacer()
            NavigationLink(destination: AllCountriesView(gr: gr, countries: self.$countries, topCountries: self.$topCountries).navigationBarTitle("").navigationBarHidden(true)) {
                Text("View All")
                    .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
            }
            
        }.padding()
        
    }
}
