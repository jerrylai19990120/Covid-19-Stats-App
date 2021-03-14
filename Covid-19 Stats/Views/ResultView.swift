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
    
    var body: some View {
        VStack {
            Text("")
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            ResultView(gr: gr)
        }
    }
}
