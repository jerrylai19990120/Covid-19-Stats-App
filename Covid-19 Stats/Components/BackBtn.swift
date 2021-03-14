//
//  BackBtn.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct BackBtn: View {
    
    var gr: GeometryProxy
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var body: some View {
        Image(systemName: "chevron.left")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: gr.size.width*0.03, height: gr.size.width*0.03)
            .padding()
            .foregroundColor(tabColor)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(tabColor, lineWidth: 2))
    }
}

struct BackBtn_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            BackBtn(gr: gr)
        }
    }
}
