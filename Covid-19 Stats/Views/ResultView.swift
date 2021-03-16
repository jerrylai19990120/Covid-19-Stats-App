//
//  ResultView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    
    var gr: GeometryProxy
    
    @Binding var result: Country
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                CountryView(gr: gr, country: result)
            }
        }
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ResultView(gr: gr, result: .constant(Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)))
        }
    }
}
