//
//  BannerDetailView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-16.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct BannerDetailView: View {
    
    var gr: GeometryProxy
    
    var title = "Symptoms of COVID-19"
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var body: some View {
        VStack {
            HStack {
                BackBtn(gr: gr)
                Spacer()
                Text(title)
                    .foregroundColor(fontColor)
                    .font(.system(size: gr.size.width*0.046, weight: .semibold, design: .rounded))
                Spacer()
                Spacer()
            }.padding([.leading, .trailing])
            
            
            
        }
    }
}

struct BannerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            BannerDetailView(gr: gr)
        }
    }
}
