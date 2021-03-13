//
//  VacinationSection.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-12.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct VacinationSection: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var body: some View {
        VStack {
            HStack {
                Text("Covid-19 Vaccine Brands")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
                
                Text("11 March 2021")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.tabColor)
                Spacer()
            }.padding(.leading)
            .padding(.bottom)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Pfizer-BioNTech")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                    Spacer()
                    Text("Type: mRNA")
                        .font(.system(size: gr.size.width*0.04, weight: .light, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                }.padding([.leading, .trailing])
                
                
                
                HStack {
                    Text("Number of shots: ")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                    Text("2 shots, 21 days apart")
                        .font(.system(size: gr.size.width*0.036, weight: .light, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                }.padding([.leading, .trailing])
                
            }.padding(.bottom)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Moderna")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                    Spacer()
                    Text("Type: mRNA")
                        .font(.system(size: gr.size.width*0.04, weight: .light, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                }.padding([.leading, .trailing])
                
               
                
                HStack {
                    Text("Number of shots: ")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                    Text("2 shots, one month (28 days) apart")
                        .font(.system(size: gr.size.width*0.036, weight: .light, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                }.padding([.leading, .trailing])
            }.padding(.bottom)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Johnson & Johnson /Janssen")
                        .font(.system(size: gr.size.width*0.04, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                    Spacer()
                    Text("Type: Viral vector")
                        .font(.system(size: gr.size.width*0.04, weight: .light, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                }.padding([.leading, .trailing])
                
                
                HStack {
                    Text("Number of shots: ")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                    Text("1 shot")
                        .font(.system(size: gr.size.width*0.036, weight: .light, design: .rounded))
                        .foregroundColor(self.fontColor)
                    
                }.padding([.leading, .trailing])
            }
            
            
        }.padding(.top)
        .frame(width: gr.size.width)
    }
}

struct VacinationSection_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            VacinationSection(gr: gr)
        }
    }
}
