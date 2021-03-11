//
//  HomeView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-11.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader { gr in
            VStack {
                HomeViewBanner(gr: gr).padding(.leading)
            }
        }//geo reader
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
