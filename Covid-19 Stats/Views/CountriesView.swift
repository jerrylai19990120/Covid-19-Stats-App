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
    
    var activeColor = Color(red: 255/255, green: 173/255, blue: 61/255)
    var recoveredColor = Color(red: 0/255, green: 191/255, blue: 165/255)
    var deathColor = Color(red: 255/255, green: 80/255, blue: 93/255)
    
    @State var selection = 0
    
    @State var offset: CGFloat = 0
    
    @State var scale: CGFloat = 1
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Live update")
                    .font(.system(size: gr.size.width*0.06, weight: .semibold, design: .default))
                    .foregroundColor(fontColor)
                
                Spacer()
            }.padding()
            
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                .fill(tabColor)
                    .frame(width: gr.size.width/5*scale, height: gr.size.height*0.18/4)
                    .offset(x: -gr.size.width/2.62+offset)
                
                HStack {
                    
                    Button(action: {
                        self.selection = 0
                        self.offset = 0
                        self.scale = 1
                    }) {
                        Text("Today")
                            .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                            .foregroundColor(selection==0 ? fontColor: tabColor)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.selection = 1
                        self.offset = self.gr.size.width/2.32
                        self.scale = 1.3
                    }) {
                        Text("Yesterday")
                            .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                            .foregroundColor(selection==1 ? fontColor: tabColor)
                    }
                    
                    
                    Spacer()
                    
                }.padding([.leading, .trailing], gr.size.width*0.06)
            }.animation(.default)
            //zstack
            
            
            HStack {
                Spacer()
                
                VStack {
                    Text("Country Region")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                        
                }
                Spacer()
                VStack {
                    Text("Total infected")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                }
                
                VStack {
                    Text("Total recovered")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                }
                
                
                VStack {
                    Text("New infected")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                }
                
                VStack {
                    Text("Total deaths")
                        .font(.system(size: gr.size.width*0.036, weight: .semibold, design: .default))
                        .foregroundColor(tabColor)
                }
                
            }.padding()
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
