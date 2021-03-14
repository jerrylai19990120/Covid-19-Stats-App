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
    
    var body: some View {
        GeometryReader { gr in
            
            ZStack {
                if self.selection == 0 {
                    MainView(gr: gr)
                }
                
                if self.selection == 1 {
                    CountriesView(gr: gr)
                }
                
                if self.selection == 2 {
                    SearchView(gr: gr)
                }
                VStack {
                    Spacer()
                    CustomTabBar(gr: gr, selection: self.$selection).offset(y: gr.size.height*0.06)
                }
                
                
            }//zstack
            
        }//geo reader
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct MainView: View {
    
    var gr: GeometryProxy
    
    var body: some View {
        
        
            VStack(spacing: 0) {
                
                HomeViewBanner(gr: gr).padding(.leading)
                
                InfoSection(gr: gr)
                
                TopCountriesList(gr: gr)
                
            }.padding(.bottom, gr.size.height*0.13)
            .frame(height: gr.size.height)
            
        
       
    }
    

}

