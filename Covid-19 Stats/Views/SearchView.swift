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
    
    @State var pharmacies: [Pharmacy] = [Pharmacy]()
    
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
            
            if query != "" {
                ResultView(gr: gr)
            } else {
                VStack {
                    HStack {
                        Text("Requirements")
                            .foregroundColor(fontColor)
                            .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: gr.size.width*0.07) {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 246/255, green: 200/255, blue: 56/255))
                                    .frame(width: gr.size.width*0.38, height: gr.size.width*0.38)
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                                    .offset(x:gr.size.width*0.1, y: -gr.size.width*0.14)
                                    .opacity(0.28)
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: gr.size.width*0.16, height: gr.size.width*0.16)
                                    .offset(x:gr.size.width*0.18, y: -gr.size.width*0.05)
                                    .opacity(0.28)
                                    
                                
                                VStack {
                                    Text("Wear a mask")
                                        .foregroundColor(.white)
                                        .font(.system(size: gr.size.width*0.038, weight: .semibold, design: .rounded))
                                    
                                    Image("mask")
                                        .resizable()
                                        .frame(width: gr.size.width*0.18, height: gr.size.width*0.18)
                                }
                            }.clipped()
                            .cornerRadius(20)
                            .contextMenu {
                                Text("Mask on in public areas 😷")
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(red: 76/255, green: 91/255, blue: 236/255))
                                    .frame(width: gr.size.width*0.38, height: gr.size.width*0.38)
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                                    .offset(x:gr.size.width*0.1, y: -gr.size.width*0.14)
                                    .opacity(0.28)
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: gr.size.width*0.16, height: gr.size.width*0.16)
                                    .offset(x:gr.size.width*0.18, y: -gr.size.width*0.05)
                                    .opacity(0.28)
                                    
                                
                                VStack {
                                    Text("Use hand sanitizer")
                                        .foregroundColor(.white)
                                        .font(.system(size: gr.size.width*0.038, weight: .semibold, design: .rounded))
                                    
                                    Image("handsanitizer")
                                        .resizable()
                                        .frame(width: gr.size.width*0.18, height: gr.size.width*0.18)
                                }
                            }.clipped()
                            .cornerRadius(20)
                            .contextMenu {
                                Text("Use hand sanitizer frequently 🧴")
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(red: 251/255, green: 114/255, blue: 65/255))
                                    .frame(width: gr.size.width*0.38, height: gr.size.width*0.38)
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                                    .offset(x:gr.size.width*0.1, y: -gr.size.width*0.14)
                                    .opacity(0.28)
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: gr.size.width*0.16, height: gr.size.width*0.16)
                                    .offset(x:gr.size.width*0.18, y: -gr.size.width*0.05)
                                    .opacity(0.28)
                                
                                VStack {
                                    Text("Social distancing")
                                        .foregroundColor(.white)
                                        .font(.system(size: gr.size.width*0.038, weight: .semibold, design: .rounded))
                                    
                                    Image("socialdistance")
                                        .resizable()
                                        .frame(width: gr.size.width*0.18, height: gr.size.width*0.18)
                                }
                            }.clipped()
                            .cornerRadius(20)
                            .contextMenu {
                                Text("Stay 6 feet away from each other 🧍‍♀️6️⃣🧍‍♂️")
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(red: 246/255, green: 200/255, blue: 56/255))
                                    .frame(width: gr.size.width*0.38, height: gr.size.width*0.38)
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: gr.size.width*0.2, height: gr.size.width*0.2)
                                    .offset(x:gr.size.width*0.1, y: -gr.size.width*0.14)
                                    .opacity(0.28)
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: gr.size.width*0.16, height: gr.size.width*0.16)
                                    .offset(x:gr.size.width*0.18, y: -gr.size.width*0.05)
                                    .opacity(0.28)
                                    
                                
                                
                                VStack {
                                    Text("Wash your hands")
                                        .foregroundColor(.white)
                                        .font(.system(size: gr.size.width*0.038, weight: .semibold, design: .rounded))
                                    
                                    Image("washhands")
                                        .resizable()
                                        .frame(width: gr.size.width*0.18, height: gr.size.width*0.18)
                                }
                                
                            }.clipped()
                            .cornerRadius(20)
                            .contextMenu {
                                Text("Always wash your hands 🧼")
                            }
                            
                            
                        }
                    }
                    
                }.padding()
                
                
                VStack {
                    HStack {
                        Text("Nearest Pharmacies")
                            .foregroundColor(fontColor)
                            .font(.system(size: gr.size.width*0.06, weight: .medium, design: .rounded))
                        Spacer()
                        
                        NavigationLink(destination: MapUIView(gr: gr).navigationBarTitle("").navigationBarHidden(true)) {
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
                        
                    }
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(self.pharmacies, id: \.self){
                                i in
                                PharmacyView(gr: self.gr,title: i.name, addr: i.title, img: Int.random(in: 0...2)).padding(.bottom)
                            }
                            
                        }.padding(.top)
                    }
                    
                    
                    
                }.padding([.leading, .trailing])
            }
            
            
            
            
        }.frame(height: gr.size.height)
        .onAppear {
            DataService.instance.getNearByPharmacies { (success) in
                if success {
                    self.pharmacies = DataService.instance.pharmacies
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            SearchView(gr: gr)
        }
    }
}
