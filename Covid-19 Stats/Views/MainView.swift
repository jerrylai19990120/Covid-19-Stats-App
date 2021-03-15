//
//  MainView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    var gr: GeometryProxy
    
    @Binding var topCountries: [Country]
    
    var body: some View {
        
        
            VStack(spacing: 0) {
                
                HomeViewBanner(gr: gr).padding(.leading)
                    
                InfoSection(gr: gr)
                    
                TopCountriesList(gr: gr, topCountries: self.$topCountries)
                
            }.frame(height: gr.size.height)

       
    }
    

}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            MainView(gr: gr, topCountries: .constant([Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)]))
        }
    }
}
