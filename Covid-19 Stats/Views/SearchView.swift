//
//  SearchView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-13.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    var gr: GeometryProxy
    
    @State var query = ""
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var body: some View {
        VStack {
            HStack {
                Text("Search, Buy, \n& Protect Your Family!")
                    .foregroundColor(fontColor)
                    .font(.system(size: gr.size.width*0.07, weight: .semibold, design: .rounded))
                    .padding()
                Spacer()
            }
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gr.size.width*0.06)
                    .foregroundColor(tabColor)
                
                TextField("Search country stats", text: $query)
                
            }.padding()
            .frame(width: gr.size.width*0.8)
            .background(bgColor)
            .cornerRadius(20)
            
            
            VStack {
                HStack {
                    Text("Requirements")
                        .foregroundColor(fontColor)
                        .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(bgColor)
                            .frame(width: gr.size.width*0.38, height: gr.size.width*0.38)
                        
                        RoundedRectangle(cornerRadius: 10)
                        .fill(bgColor)
                        .frame(width: gr.size.width*0.38, height: gr.size.width*0.38)
                        
                        RoundedRectangle(cornerRadius: 10)
                        .fill(bgColor)
                        .frame(width: gr.size.width*0.38, height: gr.size.width*0.38)
                        
                    }
                }
                
            }.padding()
            
            
            VStack {
                HStack {
                    Text("Nearest Pharmacies")
                        .foregroundColor(fontColor)
                        .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                    Spacer()
                    
                    HStack(spacing: 2) {
                        Text("map")
                            .foregroundColor(fontColor)
                            .font(.system(size: gr.size.width*0.05, weight: .medium, design: .rounded))
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(fontColor)
                            .frame(width: gr.size.width*0.03, height: gr.size.width*0.03)
                        
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        PharmacyView(gr: gr).padding(.bottom)
                        
                        PharmacyView(gr: gr).padding(.bottom)
                        
                        PharmacyView(gr: gr).padding(.bottom)
                        
                    }.padding(.bottom, gr.size.height*0.1)
                }
                
                
                
            }.padding()
            
            
        }.frame(height: gr.size.height)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            SearchView(gr: gr)
        }
    }
}
