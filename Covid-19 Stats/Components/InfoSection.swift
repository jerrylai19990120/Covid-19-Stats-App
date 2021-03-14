//
//  InfoSection.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-12.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct InfoSection: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var activeColor = Color(red: 255/255, green: 173/255, blue: 61/255)
    var recoveredColor = Color(red: 0/255, green: 191/255, blue: 165/255)
    var deathColor = Color(red: 255/255, green: 80/255, blue: 93/255)
    
    @State var selection = 0
    
    var body: some View {
        VStack {
            ZStack {
                CasesSection(gr: gr)
                    .opacity(selection==0 ? 1 : 0)
                VacinationSection(gr: gr)
                    .opacity(selection==1 ? 1 : 0)
                PrecautionSection(gr: gr)
                    .opacity(selection==2 ? 1 : 0)
            }
            
            OptionsBar(gr: gr, selection: $selection)
        }.animation(.default)
    }
}

struct InfoSection_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            InfoSection(gr: gr)
        }
        
    }
}

struct CasesSection: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var activeColor = Color(red: 255/255, green: 173/255, blue: 61/255)
    var recoveredColor = Color(red: 0/255, green: 191/255, blue: 165/255)
    var deathColor = Color(red: 255/255, green: 80/255, blue: 93/255)
    
    var body: some View {
        VStack {
            HStack {
                Text("Today's Statistics")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
                
                Text("11 March 2021")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.tabColor)
                Spacer()
            }.padding(.leading)
            
            HStack(spacing: 2){
                RoundedRectangle(cornerRadius: 6)
                    .fill(self.activeColor)
                    .frame(width: gr.size.width*0.92*0.4, height: gr.size.height*0.04)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(self.recoveredColor)
                    .frame(width: gr.size.width*0.92*0.4, height: gr.size.height*0.04)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(self.deathColor)
                    .frame(width: gr.size.width*0.92*0.2, height: gr.size.height*0.04)
                
            }
            
            HStack {
                Text("Active")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
                Spacer()
                Text("8590")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(self.activeColor)
                    .frame(width: gr.size.width*0.03, height: gr.size.width*0.03)
                
            }.padding([.leading, .trailing])
            
            HStack {
                Text("Recovered")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
                Spacer()
                Text("18590")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(self.recoveredColor)
                    .frame(width: gr.size.width*0.03, height: gr.size.width*0.03)
                
            }.padding([.leading, .trailing])
            
            HStack {
                Text("Dead")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
                Spacer()
                Text("432")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
                
                RoundedRectangle(cornerRadius: 2)
                    .fill(self.deathColor)
                    .frame(width: gr.size.width*0.03, height: gr.size.width*0.03)
                
            }.padding([.leading, .trailing])
            
            
        }.frame(width: gr.size.width)
    }
}
