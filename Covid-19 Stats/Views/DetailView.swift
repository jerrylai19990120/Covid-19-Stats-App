//
//  DetailView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-13.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct DetailView: View {
    
    var gr: GeometryProxy
    
    var country: Country
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 91/255, green: 184/255, blue: 168/255)
    
    @State var popup = false
    
    @Binding var topCountries: [Country]
    
    @Binding var countries: [Country]
    
    
    var body: some View {
        ZStack {
            fontColor
            ZStack {
                
                DetailData(gr: gr, popup: $popup, topCountries: self.$topCountries, countries: self.$countries, country: country)
                
                VStack(alignment: .center) {
                    
                    Text("\(self.countryFlag(countryCode: country.countryCode)) \(country.name)")
                        .foregroundColor(.white)
                        .font(.system(size: gr.size.width*0.07, weight: .semibold, design: .default))
                        .padding(.trailing, gr.size.width*0.1)
                        
                    
                    Text("\(country.active)")
                        .foregroundColor(.white)
                        .font(.system(size: gr.size.width*0.1, weight: .semibold, design: .default))
                    
                    Spacer()
                    
                }.frame(height: gr.size.height)
                .offset(y: -gr.size.height*0.03)
                    
            }
            
            
        }.edgesIgnoringSafeArea([.top, .bottom])
        .onAppear {
            self.popup = true
        }
        
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            DetailView(gr: gr, country: Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0), topCountries: .constant([Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)]), countries: .constant([Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)]))
        }
    }
}

struct DetailData: View {
    
    var gr: GeometryProxy
    
    @Binding var popup: Bool
    
    @Binding var topCountries: [Country]
    
    @Binding var countries: [Country]
    
    @State var country = Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)
    
    @State var cases:[Double] = [0,0,0]
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
            
            
            VStack {
                VStack {
                    LineView(data: cases, title: "Total Cases").padding()
                }.frame(height: gr.size.height*0.5)
                    .scaleEffect(gr.size.width*0.0024)
                
                TopCountriesList(gr: gr, topCountries: self.$topCountries, countries: self.$countries)
            }.offset(y: popup ? -gr.size.height*0.21 : gr.size.height+88)
            
            
        }.offset(y: popup ? gr.size.height*0.26 : gr.size.height+88)
            .animation(.default)
            .onAppear {
                
                var arr = DataService.instance.dailyCases.filter({
                    let arr2 = $0.split(separator: ",")
                   
                    if arr2.count != 0 {
                        let val = arr2[0].lowercased()
                        let match =  self.country.name.lowercased().range(of: val)
                        return match != nil ? true : false
                    } else {
                        return false
                    }
                    
                })
                
                if arr.count != 0 {
                    var items = arr[0].split(separator: ",")
                    items.remove(at: 0)
                    let cases = items.map({Double(String($0))!})
                    self.cases = cases
                    
                }
                
        }
    }
}
