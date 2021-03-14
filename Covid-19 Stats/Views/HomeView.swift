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
        NavigationView {
            GeometryReader { gr in
                
                ZStack {
                    if self.selection == 0 {
                        MainView(gr: gr)
                            .offset(y: -gr.size.height*0.14)
                            .frame(height: gr.size.height*1.14)
                    }
                    
                    if self.selection == 1 {
                        CountriesView(gr: gr)
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
                    
                    
                }
                //zstack
                
            }//geo reader
        }.navigationBarTitle("")
        .navigationBarHidden(true)
        .accentColor(.white)
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


