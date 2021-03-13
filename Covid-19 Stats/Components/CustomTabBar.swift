//
//  CustomTabBar.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-11.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct CustomTabBar: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    @Binding var selection: Int
    @State var offset:CGFloat = 0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(bgColor)
                .frame(width: gr.size.width, height: gr.size.height*0.18)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(tabColor)
                    .frame(width: gr.size.width/3.3, height: gr.size.height*0.18/3)
                    .offset(x: -gr.size.width/3+offset)
                
                
                HStack {
                    
                    Button(action: {
                        self.selection = 0
                        self.offset = 0
                    }) {
                        HStack {
                            Image(systemName: "square.grid.2x2")
                                .resizable()
                                .frame(width: gr.size.width*0.05, height: gr.size.width*0.05)
                                .foregroundColor(fontColor)
                            
                            if self.selection == 0 {
                                Text("Home")
                                    .foregroundColor(fontColor)
                                    .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                            }
                            
                        }.frame(width: gr.size.width/3)
                    }
                    
                    
                    Button(action: {
                        self.selection = 1
                        self.offset = 0 + self.gr.size.width/3
                    }) {
                        HStack {
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: gr.size.width*0.05, height: gr.size.width*0.05)
                                .foregroundColor(fontColor)
                            
                            if self.selection == 1 {
                                Text("Countries")
                                    .foregroundColor(fontColor)
                                    .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                            }
                            
                        }.frame(width: gr.size.width/3)
                    }
                    
                    
                    
                    Button(action: {
                        self.selection = 2
                        self.offset = 0 + self.gr.size.width/3 + self.gr.size.width/3
                    }) {
                        HStack(alignment: .center) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: gr.size.width*0.05, height: gr.size.width*0.05)
                                .foregroundColor(fontColor)
                            
                            
                            if self.selection == 2 {
                                Text("Search")
                                    .foregroundColor(fontColor)
                                    .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                            }
                            
                        }.frame(width: gr.size.width/3)
                            .offset(x: selection==2 ? -gr.size.width*0.023 : 0)
                    }
                    
                    
                }

            }.offset(y: -gr.size.height*0.03)

        }.animation(.default)
        .frame(width: gr.size.width)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            CustomTabBar(gr: gr, selection: .constant(0))
        }
    }
}
