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
    
    let styles = [
        ChartStyle(backgroundColor:Color(red: 52/255, green: 138/255, blue: 123/255), accentColor: .white, secondGradientColor: .white, textColor: .white, legendTextColor: .white, dropShadowColor: .clear),
        ChartStyle(backgroundColor:Color(red: 255/255, green: 131/255, blue: 104/255), accentColor: .white, secondGradientColor: .white, textColor: .white, legendTextColor: .white, dropShadowColor: .clear),
        ChartStyle(backgroundColor: Color(red: 255/255, green: 211/255, blue: 98/255), accentColor: .white, secondGradientColor: .white, textColor: .white, legendTextColor: .white, dropShadowColor: .clear)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            SubHeader(gr: gr)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    NavigationLink(destination: DetailView(gr: gr).navigationBarTitle("").navigationBarHidden(true)) {
                        LineChartView(data: [1,2,5,32,33,37,38,39,43], title: "\(self.countryFlag(countryCode: "US")) USA", legend: "100,000,200", style: self.styles[Int.random(in: 0...2)], form: ChartForm.small).frame(width: gr.size.width*0.4, height: gr.size.height*0.24)
                            .scaleEffect(gr.size.width*0.00169)
                    }
                    
                    
                    
                    NavigationLink(destination: DetailView(gr: gr).navigationBarTitle("").navigationBarHidden(true)) {
                        LineChartView(data: [1,2,5,32,33,37,38,39,43], title: "\(self.countryFlag(countryCode: "US")) USA", legend: "100,000,200", style: self.styles[Int.random(in: 0...2)], form: ChartForm.small).frame(width: gr.size.width*0.4, height: gr.size.height*0.24)
                            .scaleEffect(gr.size.width*0.00169)
                    }
                    
                    NavigationLink(destination: DetailView(gr: gr).navigationBarTitle("").navigationBarHidden(true)) {
                        LineChartView(data: [1,2,5,32,33,37,38,39,43], title: "\(self.countryFlag(countryCode: "US")) USA", legend: "100,000,200", style: self.styles[Int.random(in: 0...2)], form: ChartForm.small).frame(width: gr.size.width*0.4, height: gr.size.height*0.24)
                            .scaleEffect(gr.size.width*0.00169)
                    }
                    
                    
                }
                
            }
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


struct TopCountriesList_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            TopCountriesList(gr: gr)
        }
    }
}


struct SubHeader: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    
    var body: some View {
        HStack {
            Text("Top Countries")
                .font(.system(size: gr.size.width*0.06, weight: .bold, design: .rounded))
                .foregroundColor(self.fontColor)
            Spacer()
            NavigationLink(destination: AllCountriesView(gr: gr).navigationBarTitle("").navigationBarHidden(true)) {
                Text("View All")
                    .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
            }
            
        }.padding()
    }
}
