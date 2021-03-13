//
//  OptionsBar.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-12.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct OptionsBar: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    @Binding var selection: Int
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
            .fill(tabColor)
            .frame(width: gr.size.width/3.3, height: gr.size.height*0.18/3)
                .offset(x: -gr.size.width/3.5+offset)
            
            HStack {
                Spacer()
                Button(action: {
                    self.selection = 0
                    self.offset = 0
                }) {
                    Text("Today's Cases")
                        .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                        .foregroundColor(selection==0 ? fontColor: tabColor)
                }
                
                Spacer()
                
                Button(action: {
                    self.selection = 1
                    self.offset = self.gr.size.width/3.28
                }) {
                    Text("Vacination")
                        .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                        .foregroundColor(selection==1 ? fontColor: tabColor)
                }
                
                
                Spacer()
                
                Button(action: {
                    self.selection = 2
                    self.offset = self.gr.size.width/3.38 * 2
                }) {
                    Text("Precautions")
                        .font(.system(size: gr.size.width*0.04, weight: .bold, design: .rounded))
                        .foregroundColor(selection==2 ? fontColor: tabColor)
                }
                
                
                Spacer()
            }
        }.animation(.default)
        //zstack
        
    }
}

struct OptionsBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            OptionsBar(gr: gr, selection: .constant(0))
        }
    }
}
