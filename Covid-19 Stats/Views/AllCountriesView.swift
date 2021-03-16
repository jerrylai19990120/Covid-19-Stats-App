//
//  AllCountriesView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-14.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct AllCountriesView: View {
    
    var gr: GeometryProxy
    
    @Binding var countries: [Country]
    
    @Binding var topCountries: [Country]
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    @State var selection = 0
    
    var body: some View {
        
        VStack {
            HStack {
                NavigationLink(destination: HomeView().navigationBarTitle("").navigationBarHidden(true)) {
                    BackBtn(gr: gr)
                }
                
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tabColor)
                        .frame(width: gr.size.width*0.28, height: gr.size.height*0.05)
                        .offset(x: selection==0 ? -gr.size.width*0.14 : gr.size.width*0.13)
                    
                    HStack(spacing: gr.size.width*0.04) {
                        Button(action: {
                            self.selection = 0
                        }) {
                            Text("High to low")
                                .foregroundColor(selection==0 ? fontColor : tabColor)
                                .font(.system(size: gr.size.width*0.046, weight: .medium, design: .rounded))
                        }
                        
                        Button(action: {
                            self.selection = 1
                        }) {
                            Text("Low to high")
                                .foregroundColor(selection==1 ? fontColor : tabColor)
                                .font(.system(size: gr.size.width*0.046, weight: .medium, design: .rounded))
                        }
                        
                    }
                }.animation(.default)
            }.padding([.leading, .trailing])
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(self.countries, id: \.self){
                        i in
                        NavigationLink(destination: DetailView(gr: self.gr, country: i, topCountries: self.$topCountries, countries: self.$countries).navigationBarTitle("").navigationBarHidden(true)) {
                            CountryView(gr: self.gr, country: i)
                        }
                        
                    }
                }
            }
            
        }//vstack
        
    }
}

struct AllCountriesView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            AllCountriesView(gr: gr, countries: .constant([Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)]), topCountries: .constant([Country(name: "", countryCode: "", totalInfected: 0, active: 0, recovered: 0, deaths: 0)]))
        }
    }
}

