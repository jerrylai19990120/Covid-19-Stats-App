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
    
    @State var selection = 0
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Live update")
                    .font(.system(size: gr.size.width*0.06, weight: .semibold, design: .default))
                    .foregroundColor(fontColor)
                
                Spacer()
            }.padding()
            
            OptionsBar(gr: gr, selection: $selection)
            
            HStack {
                Spacer()
                Text("Country Region")
                
                Text("Total infected")
                
                Text("Total recovered")
                
                Text("New infected")
                
                Text("Total deaths")
            }
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            CountriesView(gr: gr)
        }
        
    }
}
