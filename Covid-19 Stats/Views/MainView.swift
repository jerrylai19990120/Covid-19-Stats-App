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
    
    var body: some View {
        
        
            VStack(spacing: 0) {
                
                HomeViewBanner(gr: gr).padding(.leading)
                    
                InfoSection(gr: gr)
                    
                TopCountriesList(gr: gr)
                
            }.frame(height: gr.size.height)

       
    }
    

}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            MainView(gr: gr)
        }
    }
}
