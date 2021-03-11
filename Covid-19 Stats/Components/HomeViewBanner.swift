//
//  HomeViewBanner.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-11.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct HomeViewBanner: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(bgColor)
                .frame(width: gr.size.width*0.9, height: gr.size.height*0.2)
            
            HStack {
                Image("fever")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gr.size.width*0.46, height: gr.size.width*0.46)
                    
                VStack(spacing: gr.size.height*0.02) {
                    Text("5 Symtomps of Covid - 19")
                        .foregroundColor(fontColor)
                        .font(.system(size: gr.size.width*0.05, weight: .bold, design: .rounded))
                    
                    VStack {
                        Text("Read More")
                            .foregroundColor(fontColor)
                            .font(.system(size: gr.size.width*0.048, weight: .semibold, design: .rounded))
                        Rectangle()
                            .fill(fontColor)
                            .frame(width: gr.size.width*0.2, height: 2)
                        
                    }
                    
                }
            }//.offset(x: -gr.size.width*0.06)
            
        }.padding()
    }
}

struct HomeViewBanner_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            HomeViewBanner(gr: gr)
        }
    }
}
