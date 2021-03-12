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
    var body: some View {
        GeometryReader { gr in
            VStack {
                
                HomeViewBanner(gr: gr).padding(.leading)
                Spacer()
               /* HStack {
                    BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "Title", form: ChartForm.small)
                    
                    VStack {
                        LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", form: ChartForm.small)
                        LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", form: ChartForm.small)
                    }
                }
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", form: ChartForm.small)
                        LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", form: ChartForm.small)
                        LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", form: ChartForm.small)
                        
                    }
                }*/
                
                CustomTabBar(gr: gr).offset(y: gr.size.height*0.048)
            }.edgesIgnoringSafeArea(.bottom)
        }//geo reader
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
