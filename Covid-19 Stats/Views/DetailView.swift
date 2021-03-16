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
                
                DetailData(gr: gr, popup: $popup, topCountries: self.$topCountries, countries: self.$countries)
                
                VStack {
                    
                    VStack(alignment: .center) {
                        HStack {
                            NavigationLink(destination: HomeView().navigationBarTitle("").navigationBarHidden(true)) {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: gr.size.width*0.03, height: gr.size.width*0.03)
                                    .padding()
                                    .foregroundColor(tabColor)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(tabColor, lineWidth: 2))
                            }
                            
                            
                            Spacer()
                            
                            Text("\(self.countryFlag(countryCode: country.countryCode)) \(country.name)")
                                .foregroundColor(.white)
                                .font(.system(size: gr.size.width*0.07, weight: .semibold, design: .default))
                                .padding(.trailing, gr.size.width*0.1)
                            
                            Spacer()
                            
                            
                        }.padding()
                        
                        Text("\(country.active)")
                            .foregroundColor(.white)
                            .font(.system(size: gr.size.width*0.1, weight: .semibold, design: .default))
                        
                        
                        
                    }
                    Spacer()
                }
            }.offset(y: gr.size.height*0.05)
            
        }.edgesIgnoringSafeArea([.top, .bottom])
        .onAppear {
                self.popup = true
        }
        .onDisappear {
            self.popup = false
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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
            
            VStack {
                VStack {
                    LineView(data: [8,23,54,32,12,37,7,23,43], title: "Total Cases").padding()
                }.frame(height: gr.size.height*0.5)
                    .scaleEffect(gr.size.width*0.0024)
                
                TopCountriesList(gr: gr, topCountries: self.$topCountries, countries: self.$countries)
            }.offset(y: popup ? -gr.size.height*0.21 : gr.size.height+88)
            
            
        }.offset(y: popup ? gr.size.height*0.26 : gr.size.height+88)
            .animation(.default)
    }
}
