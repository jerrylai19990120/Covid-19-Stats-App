//
//  PrecautionSection.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-12.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct PrecautionSection: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var activeColor = Color(red: 255/255, green: 173/255, blue: 61/255)
    
    var body: some View {
        HStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("To prevent the spread of COVID-19:")
                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    .foregroundColor(self.fontColor)
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 2)
                        .fill(self.activeColor)
                        .frame(width: gr.size.width*0.02, height: gr.size.width*0.02)
                        Text("Maintain a safe distance from anyone who is coughing or sneezing.")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                        Spacer()
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 2)
                        .fill(self.activeColor)
                        .frame(width: gr.size.width*0.02, height: gr.size.width*0.02)
                        Text("Clean your hands often. Use soap and water, or an alcohol-based hand rub.")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                        Spacer()
                    }
                    
                    
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 2)
                        .fill(self.activeColor)
                        .frame(width: gr.size.width*0.02, height: gr.size.width*0.02)
                        Text("Wear a mask when physical distancing is not possible.")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                        Spacer()
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 2)
                        .fill(self.activeColor)
                        .frame(width: gr.size.width*0.02, height: gr.size.width*0.02)
                        Text("Don’t touch your eyes, nose or mouth.")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                        Spacer()
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 2)
                        .fill(self.activeColor)
                        .frame(width: gr.size.width*0.02, height: gr.size.width*0.02)
                        Text("Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                        Spacer()
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 2)
                        .fill(self.activeColor)
                        .frame(width: gr.size.width*0.02, height: gr.size.width*0.02)
                        Text("Stay home if you feel unwell.")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                        Spacer()
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 2)
                        .fill(self.activeColor)
                        .frame(width: gr.size.width*0.02, height: gr.size.width*0.02)
                        Text("If you have a fever, cough and difficulty breathing, seek medical attention.")
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                        .foregroundColor(self.fontColor)
                        Spacer()
                    }
                    
                    
                    
                    
                }
            }
            
            Spacer()
            Image("distancing")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
            
        }.padding([.top, .leading, .trailing])
            .frame(height: gr.size.height*0.23)
    }
}

struct PrecautionSection_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            PrecautionSection(gr: gr)
        }
    }
}
