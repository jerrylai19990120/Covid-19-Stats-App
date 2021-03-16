//
//  BannerDetailView.swift
//  Covid-19 Stats
//
//  Created by Jerry Lai on 2021-03-16.
//  Copyright © 2021 Jerry Lai. All rights reserved.
//

import SwiftUI

struct BannerDetailView: View {
    
    var gr: GeometryProxy
    
    var title = "Symptoms of COVID-19"
    
    var isSymptoms = true
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var symptoms:[[String:String]] = [
        ["img":"cough", "name": "Dry Cough", "desc": "A dry cough is a cough that doesn't bring up mucus"],
        ["img":"breathless", "name": "Shortness of breath", "desc": "Difficulty breathing or feeling like out of breath"],
        ["img":"fever", "name": "Feeling feverish", "desc": "Having fever or cold symptoms. E.g Runny nose"],
        ["img":"chills", "name": "Chills", "desc": "Having chills and feeling cold"],
        ["img":"fatigue", "name": "Fatigue or weakness", "desc": "Feeling dizzy and tired, extra fatigue"],
        ["img":"bodyache", "name": "Muscle or body aches", "desc": "Muscle aches and abnormal body aches"],
        ["img":"lossSmell", "name": "New loss of smell or taste", "desc": "Newly developed loss of smell and taste"],
        ["img":"headache", "name": "Headache", "desc": "Constant bad headaches"],
        ["img":"diarrhea", "name": "Gastrointestinal symptoms", "desc": "Abdominal pain, diarrhea, vomiting"],
        ["img":"fever2", "name": "Feeling very unwell", "desc": "Having a fever equal to or over 38°C"]
    ]
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: HomeView().navigationBarTitle("").navigationBarHidden(true)) {
                    BackBtn(gr: gr)
                }
                
                Spacer()
                Text(title)
                    .foregroundColor(fontColor)
                    .font(.system(size: gr.size.width*0.046, weight: .semibold, design: .rounded))
                Spacer()
                Spacer()
            }.padding([.leading, .trailing])
            
            if isSymptoms {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(self.symptoms, id: \.self){
                            i in
                            Symptom(gr: self.gr, img: i["img"]!, name: i["name"]!, desc: i["desc"]!)
                        }
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                            .fill(bgColor)
                            .frame(width: gr.size.width*0.9, height: gr.size.height*0.38)
                            
                            VStack(alignment: .leading, spacing: gr.size.width*0.02) {
                                Text("You can infect others even if you aren’t showing symptoms")
                                    .foregroundColor(fontColor)
                                    .font(.system(size: gr.size.width*0.043, weight: .semibold, design: .rounded))
                                
                                Text("haven’t yet developed symptoms (pre-symptomatic)")
                                    .foregroundColor(tabColor)
                                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                                
                                Text("never develop symptoms (asymptomatic)")
                                    .foregroundColor(tabColor)
                                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                                
                                Text("Children tend to have abdominal symptoms and skin changes or rashes.")
                                    .foregroundColor(tabColor)
                                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                                
                                Text("Symptoms may take up to 14 days to appear after exposure to COVID-19.")
                                    .foregroundColor(tabColor)
                                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                                
                            }.padding([.leading, .trailing], gr.size.width*0.12)
                        }
                            
                        
                        
                        
                    }
                }
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                            .fill(bgColor)
                            .frame(width: gr.size.width*0.9, height: gr.size.height*0.38)
                            
                            VStack(alignment: .leading, spacing: gr.size.width*0.06) {
                                Text("If you’ve tested positive")
                                    .foregroundColor(fontColor)
                                    .font(.system(size: gr.size.width*0.043, weight: .semibold, design: .rounded))
                                
                                Text("If you've received a positive test result for COVID-19, you must isolate at home, whether you have symptoms or not. Remain isolated for up to 14 days or as directed by your local public health authority.")
                                    .foregroundColor(tabColor)
                                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                                
                                Text("If you didn’t have symptoms when you got tested but develop them during your isolation period, you must restart your isolation time as directed by the local public health authority.")
                                    .foregroundColor(tabColor)
                                    .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                                
                                
                            }.padding([.leading, .trailing], gr.size.width*0.08)
                            
                        }
                    }
                }
            }
            
            
        }.frame(height: gr.size.height)
            .offset(y: -gr.size.height*0.06)
    }
}

struct BannerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { gr in
            BannerDetailView(gr: gr)
        }
    }
}

struct Symptom: View {
    
    var gr: GeometryProxy
    var img: String
    var name: String
    var desc: String
    
    var bgColor = Color(red: 235/255, green: 243/255, blue: 242/255)
    var fontColor = Color(red: 52/255, green: 138/255, blue: 123/255)
    var tabColor = Color(red: 147/255, green: 194/255, blue: 186/255)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(bgColor)
                .frame(width: gr.size.width*0.9, height: gr.size.height*0.16)
            
            HStack {
                Image(img)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: gr.size.width*0.35, height: gr.size.width*0.32)
                    
                
                
                VStack(alignment: .leading, spacing: gr.size.width*0.03) {
                    Text(name)
                        .foregroundColor(fontColor)
                        .font(.system(size: gr.size.width*0.046, weight: .semibold, design: .rounded))
                        .frame(height: gr.size.height*0.06)
                    
                    Text(desc)
                        .foregroundColor(tabColor)
                        .font(.system(size: gr.size.width*0.04, weight: .semibold, design: .rounded))
                    
                }
                
                Spacer()
                
            }.frame(width: gr.size.width*0.9)
            
        }
    }
}
