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
    
    let styles = [
        ChartStyle(backgroundColor:Color(red: 52/255, green: 138/255, blue: 123/255), accentColor: .white, secondGradientColor: .white, textColor: .white, legendTextColor: .white, dropShadowColor: .clear),
        ChartStyle(backgroundColor:Color(red: 255/255, green: 131/255, blue: 104/255), accentColor: .white, secondGradientColor: .white, textColor: .white, legendTextColor: .white, dropShadowColor: .clear),
        ChartStyle(backgroundColor: Color(red: 255/255, green: 211/255, blue: 98/255), accentColor: .white, secondGradientColor: .white, textColor: .white, legendTextColor: .white, dropShadowColor: .clear)
    ]
    
    var body: some View {
        GeometryReader { gr in
            VStack(spacing: 0) {
                
                HomeViewBanner(gr: gr).padding(.leading)
                
                Spacer()
                
                InfoSection(gr: gr)
                
                Spacer()
                
                VStack {
                    SubHeader(gr: gr)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            LineChartView(data: [1,2,5,32,33,37,38,39,43], title: "\(self.countryFlag(countryCode: "US")) USA", legend: "100,000,200", style: self.styles[Int.random(in: 0...2)], form: ChartForm.small).frame(width: gr.size.width*0.4, height: gr.size.height*0.23)
                                .scaleEffect(0.75)
                                
                            
                            LineChartView(data: [1,2,5,32,33,37,38,39,43], title: "\(self.countryFlag(countryCode: "US")) USA", legend: "100,000,200", style: self.styles[Int.random(in: 0...2)], form: ChartForm.small)
                                .frame(width: gr.size.width*0.4, height: gr.size.height*0.23)
                                .scaleEffect(0.75)
                            
                            LineChartView(data: [1,2,5,32,33,37,38,39,43], title: "\(self.countryFlag(countryCode: "US")) USA", legend: "100,000,200", style: self.styles[Int.random(in: 0...2)], form: ChartForm.small)
                                .frame(width: gr.size.width*0.4, height: gr.size.height*0.23)
                                .scaleEffect(0.75)
                            
                            
                        }
                        
                    }
                }
                
                
                
                CustomTabBar(gr: gr).offset(y: gr.size.height*0.018)
            }.edgesIgnoringSafeArea(.bottom)
        }//geo reader
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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
            Text("View All")
                .font(.system(size: gr.size.width*0.05, weight: .semibold, design: .rounded))
                .foregroundColor(self.fontColor)
        }.padding()
    }
}

struct InfoSection: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var activeColor = Color(red: 255/255, green: 173/255, blue: 61/255)
    var recoveredColor = Color(red: 0/255, green: 191/255, blue: 165/255)
    var deathColor = Color(red: 255/255, green: 80/255, blue: 93/255)
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Today's Statistics")
                        .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                    Text("11 March 2021")
                        .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                        .foregroundColor(self.tabColor)
                    Spacer()
                }.padding(.leading)
                
                HStack(spacing: 2){
                    RoundedRectangle(cornerRadius: 6)
                        .fill(self.activeColor)
                        .frame(width: gr.size.width*0.92*0.4, height: gr.size.height*0.04)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(self.recoveredColor)
                        .frame(width: gr.size.width*0.92*0.4, height: gr.size.height*0.04)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(self.deathColor)
                        .frame(width: gr.size.width*0.92*0.2, height: gr.size.height*0.04)
                    
                }
                
                HStack {
                    Text("Active")
                        .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                        .foregroundColor(self.fontColor)
                    Spacer()
                    Text("8590")
                        .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                    RoundedRectangle(cornerRadius: 2)
                        .fill(self.activeColor)
                        .frame(width: gr.size.width*0.03, height: gr.size.width*0.03)
                    
                }.padding([.leading, .trailing])
                
                HStack {
                    Text("Recovered")
                        .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                        .foregroundColor(self.fontColor)
                    Spacer()
                    Text("18590")
                        .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                    RoundedRectangle(cornerRadius: 2)
                        .fill(self.recoveredColor)
                        .frame(width: gr.size.width*0.03, height: gr.size.width*0.03)
                    
                }.padding([.leading, .trailing])
                
                HStack {
                    Text("Dead")
                        .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                        .foregroundColor(self.fontColor)
                    Spacer()
                    Text("432")
                        .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                    RoundedRectangle(cornerRadius: 2)
                        .fill(self.deathColor)
                        .frame(width: gr.size.width*0.03, height: gr.size.width*0.03)
                    
                }.padding([.leading, .trailing])
                
                
            }.frame(width: gr.size.width)
            Spacer()
            OptionsBar(gr: gr)
        }
    }
}
