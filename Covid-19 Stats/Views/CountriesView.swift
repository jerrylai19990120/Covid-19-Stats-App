//
//  CountriesView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-13.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct CountriesView: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var activeColor = Color(red: 255/255, green: 173/255, blue: 61/255)
    var recoveredColor = Color(red: 0/255, green: 191/255, blue: 165/255)
    var deathColor = Color(red: 255/255, green: 80/255, blue: 93/255)
    
    @State var selection = 0
    
    @State var offset: CGFloat = 0
    
    @State var scale: CGFloat = 1
    
    @State var countries = [
        Country(name: "USA", countryCode: "US", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "Barbados", countryCode: "BB", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "Gibraltar", countryCode: "GI", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "Lithuania", countryCode: "LT", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "China", countryCode: "CN", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "Canada", countryCode: "CA", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "Qatar", countryCode: "QA", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "India", countryCode: "IN", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "Canada", countryCode: "CA", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "Qatar", countryCode: "QA", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "India", countryCode: "IN", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "Qatar", countryCode: "QA", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323),
        Country(name: "India", countryCode: "IN", totalInfected: 1344442, active: 1323, recovered: 32323, deaths: 323)
    ]
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Live update")
                    .font(.system(size: gr.size.width*0.06, weight: .semibold, design: .default))
                    .foregroundColor(fontColor)
                
                Spacer()
            }.padding()
            
            
            SubTabBar(gr: gr, selection: $selection, offset: $offset, scale: $scale)
            
            
            
            HStack(spacing: 0) {
                
             
                VStack(alignment: .leading) {
                    Text("Country Region")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                    
                }.frame(width: gr.size.width*0.2)
          
                VStack {
                    Text("Total  confirmed")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                }.frame(width: gr.size.width*0.2)
                
                VStack {
                    Text("Total recovered")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                    
                }.frame(width: gr.size.width*0.2)
                
                
                VStack {
                    Text("Active cases")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                    
                }.frame(width: gr.size.width*0.2)
                
                VStack {
                    Text("Total deaths")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                    
                }.frame(width: gr.size.width*0.2)
                
            }.padding([.top, .bottom])
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(self.countries, id: \.self){ i in
                        HStack(spacing: 0) {
                            
                            Text("\(self.countryFlag(countryCode: "\(i.countryCode)")) \(i.name)")
                                .foregroundColor(self.fontColor)
                                .font(.system(size: self.gr.size.width*0.04, weight: .medium, design: .default))
                                .padding([.top, .bottom])
                                .frame(width: self.gr.size.width*0.2)
                            
                            Text("\(i.totalInfected)")
                                .foregroundColor(self.fontColor)
                                .font(.system(size: self.gr.size.width*0.04, weight: .medium, design: .default))
                                .padding([.top, .bottom])
                                .frame(width: self.gr.size.width*0.2)
                            
                            Text("\(i.recovered)")
                                .foregroundColor(self.recoveredColor)
                                .font(.system(size: self.gr.size.width*0.04, weight: .medium, design: .default))
                                .padding([.top, .bottom])
                                .frame(width: self.gr.size.width*0.2)
                            
                            Text("\(i.active)")
                                .foregroundColor(self.activeColor)
                                .font(.system(size: self.gr.size.width*0.04, weight: .medium, design: .default))
                                .padding([.top, .bottom])
                                .frame(width: self.gr.size.width*0.2)
                            
                            Text("\(i.deaths)")
                                .foregroundColor(self.deathColor)
                                .font(.system(size: self.gr.size.width*0.04, weight: .medium, design: .default))
                                .padding([.top, .bottom])
                                .frame(width: self.gr.size.width*0.2)
                            
                            
                        }
                    }
                }
            }
            
            Spacer()
        }.frame(height: gr.size.height)
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

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            CountriesView(gr: gr)
        }
        
    }
}

struct SubTabBar: View {
    
    var gr: GeometryProxy
    
    @Binding var selection: Int
    @Binding var offset: CGFloat
    @Binding var scale: CGFloat
    
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(tabColor)
                .frame(width: gr.size.width/5*scale, height: gr.size.height*0.18/4)
                .offset(x: -gr.size.width/2.62+offset)
            
            HStack {
                
                Button(action: {
                    self.selection = 0
                    self.offset = 0
                    self.scale = 1
                }) {
                    Text("Today")
                        .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                        .foregroundColor(selection==0 ? fontColor: tabColor)
                }
                
                Spacer()
                
                Button(action: {
                    self.selection = 1
                    self.offset = self.gr.size.width/2.32
                    self.scale = 1.3
                }) {
                    Text("Yesterday")
                        .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                        .foregroundColor(selection==1 ? fontColor: tabColor)
                }
                
                
                Spacer()
                
            }.padding([.leading, .trailing], gr.size.width*0.06)
        }.animation(.default)
    }
}
