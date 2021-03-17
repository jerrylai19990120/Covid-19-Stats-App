//
//  PharmacyView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-13.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct PharmacyView: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var imgs = [
        "doctor1",
        "doctor2",
        "doctor3"
    ]
    
    var title = "Shoppers Pharmacy"
    
    var addr = ""
    
    var distance = 10
    
    var img = 0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(bgColor)
            
            HStack {
                Image(imgs[img])
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: gr.size.width*0.3, height: gr.size.width*0.3)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(fontColor)
                        .font(.system(size: gr.size.width*0.046, weight: .medium, design: .rounded))
                        .padding(.bottom)
                    
                    Text(addr)
                        .foregroundColor(tabColor)
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                    
                    Text("\(distance) miles away")
                        .foregroundColor(tabColor)
                        .font(.system(size: gr.size.width*0.036, weight: .medium, design: .rounded))
                }
            }
            
        }.frame(width: gr.size.width*0.9, height: gr.size.height*0.16)
        
        
    }
}

struct PharmacyView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            PharmacyView(gr: gr)
        }
        
    }
}
