//
//  CountryView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct CountryView: View {
    
    var gr: GeometryProxy
    
    var country: Country
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var activeColor = Color(red: 255/255, green: 173/255, blue: 61/255)
    var recoveredColor = Color(red: 0/255, green: 191/255, blue: 165/255)
    var deathColor = Color(red: 255/255, green: 80/255, blue: 93/255)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(bgColor)
                .frame(width: gr.size.width*0.9, height: gr.size.height*0.3)
                .shadow(radius: 3)
            
            VStack {
                HStack {
                    VStack {
                        Text("\(self.countryFlag(countryCode: country.countryCode))")
                            .font(.system(size: gr.size.width*0.06, weight: .semibold, design: .default))
                        
                        Text(country.name)
                            .foregroundColor(fontColor)
                            .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .default))
                    }
                    Spacer()
                    VStack {
                        Text("Total confirmed")
                            .foregroundColor(fontColor)
                            .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .default))
                        
                        Text("\(country.totalInfected)")
                            .foregroundColor(activeColor)
                            .font(.system(size: gr.size.width*0.06, weight: .semibold, design: .default))
                    }
                    
                }.frame(width: gr.size.width*0.8)
                
                HStack(spacing: gr.size.width*0.08) {
                    VStack {
                        ZStack {
                            Circle()
                            .fill(activeColor)
                            .opacity(0.3)
                            .frame(width: gr.size.width*0.1, height: gr.size.width*0.1)
                            
                            Image("active")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: gr.size.width*0.08)
                        }
                        
                        Text("\(country.active)")
                            .foregroundColor(activeColor)
                            .font(.system(size: gr.size.width*0.043, weight: .medium, design: .default))
                        Text("Active")
                            .foregroundColor(activeColor)
                            .font(.system(size: gr.size.width*0.043, weight: .medium, design: .default))
                    }
                    
                    VStack {
                        ZStack {
                            Circle()
                            .fill(recoveredColor)
                            .opacity(0.3)
                            .frame(width: gr.size.width*0.1, height: gr.size.width*0.1)
                            
                            Image("recovered")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: gr.size.width*0.08)
                        }
                        
                        Text("\(country.recovered)")
                            .foregroundColor(recoveredColor)
                            .font(.system(size: gr.size.width*0.043, weight: .medium, design: .default))
                        Text("Recovered")
                            .foregroundColor(recoveredColor)
                            .font(.system(size: gr.size.width*0.043, weight: .medium, design: .default))
                    }
                    
                    VStack {
                        ZStack {
                            Circle()
                                .fill(deathColor)
                                .opacity(0.3)
                                .frame(width: gr.size.width*0.1, height: gr.size.width*0.1)
                                
                            
                            Image("deceased")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: gr.size.width*0.08)
                        }
                        
                        Text("\(country.deaths)")
                            .foregroundColor(deathColor)
                            .font(.system(size: gr.size.width*0.043, weight: .medium, design: .default))
                        Text("Deceased")
                            .foregroundColor(deathColor)
                            .font(.system(size: gr.size.width*0.043, weight: .medium, design: .default))
                    }
                }.frame(width: gr.size.width*0.9)
            }
        }.padding()
        .frame(width: gr.size.width)
        
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

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            CountryView(gr: gr, country: Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0))
        }
    }
}
