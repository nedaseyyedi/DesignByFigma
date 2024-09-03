//
//  ContentView.swift
//  DesignByFigma
//
//  Created by EDA on 6/2/1403 AP.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            ScrollView {
                VStack(spacing: 20){
                    HomeHeader()
                    CustomDevider()
                    CarsAction()
                    CustomDevider()
                    CategoryView(title: "Quick Shortcuts", showEdit: true, actionItems: quickShortcuts)
                    CustomDevider()
                    
                    CategoryView(title: "Recent Actions", showEdit: false, actionItems: recentActions)
                    
                }
                CustomDevider()
                allSettings()
                reorderButton()
                
            }.padding()
            VoiceCommandButton()
            }
        
        .foregroundColor(.white)
        .background(Color("DarkGray"))
        
            
    }
        
        
}

struct VoiceCommandButton: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "mic.fill")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .frame(width: 64, height: 64)
                    .background(Color("Green"))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding()
                    .shadow(radius: 10)
                    .foregroundColor(Color("DarkGray"))
                
            }
            
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
    }
    
    struct HomeHeader:View {
        var body: some View {
            HStack{
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Model3".uppercased())
                        .font(.caption2)
                        .fontWeight(.medium)
                        .padding(.vertical,4)
                        .padding(.horizontal,8)
                        .foregroundColor(.white)
                        .background(Color("Red"))
                        .clipShape(Capsule())
                    Text("MachFive")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                    Spacer()
                    HStack{
                        GeneralButton(icon: "lock.fill")
                        GeneralButton(icon: "gear")
                        
                        
                    
                    
                }
        }
            .padding(.top)
    }
    
}


struct GeneralButton: View {
    var icon: String
    var body: some View {
        Button(action:{}){
            Image(systemName: icon)
                .imageScale(.large)
                .frame(width: 44,height: 44)
                .background(Color.white.opacity(0.05))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white.opacity(0.01), lineWidth: 0.05))
        }
    }}



struct CustomDevider: View {
    var body: some View {
        Rectangle().frame(maxWidth: .infinity)
            .frame(height: 0.25)
            .background(Color.white)
            .opacity(0.1)
    }
}

struct CarsAction: View {
    var body: some View {
        VStack(spacing: 10){
            HStack(alignment: .center){
                HStack{
                    Image(systemName: "battery.75")
                    Text("237 Miles".uppercased())
                    
                    
                }
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(Color("Green"))
                Spacer()
                VStack(alignment: .trailing){
                    Text("Parked")
                        .fontWeight(.semibold)
                    Text("Last updated: 5 min ago")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    
                }
                
            }
            Image("Car")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
        }
        
    }
}

struct CategoryHeader: View {
    var title: String
    var showEdit: Bool = false
    var body: some View {
            HStack(alignment: .center){
                
          Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                if showEdit{
                    Button(action:{}){
                        Text("Edit")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                    }
                }
                
            }
            
        
    }
}

struct CategoryView: View {
    var title: String
    var showEdit: Bool = false
    var actionItems: [ActionItem]
    
    var body: some View {
        VStack{
      CategoryHeader(title: title, showEdit: showEdit)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top){
                    ForEach(actionItems, id: \.self){ item
                        in
                        ActionButton(item: item)
                        
                    }
                }
                
                
                
            }
        }
    }
}

struct ActionButton: View {
    var item: ActionItem
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            GeneralButton(icon: item.icon)
            Text(item.text)
                .frame(width: 72)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
        }
    }
}
struct ActionItem: Hashable {
    var icon: String
    var text: String
    
}
let quickShortcuts: [ActionItem] = [
ActionItem(icon: "bolt.fill", text: "Charging"),
ActionItem(icon: "fanblades.fill", text: "Fan On"),
ActionItem(icon: "music.note", text: "Media Controls"),
ActionItem(icon: "bolt.car", text: "Close Charge Port"),
]

let recentActions: [ActionItem] = [
ActionItem(icon: "arrow.up.square", text: "Open Trunk"),
ActionItem(icon: "fanblades", text: "Fan Off"),
ActionItem(icon: "person.fill.viewfinder", text: " Summon"),

]

struct allSettings: View {
    var body: some View {
        VStack{
          
            CategoryHeader(title: "All Settings")
            LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))], content: {
                settingBlock(icon: "car.fill", title: "Controls", subTitle: "".uppercased())
                settingBlock(icon: "fanblades.fill", title: "Climate", backgroundColor: Color("Blue"), subTitle: "Interior 60° F".uppercased() )
                settingBlock(icon: "location.fill", title: "Location", subTitle: "Empire State building".uppercased())
                settingBlock(icon: "checkerboard.shield", title: "Security", subTitle: "0 Events Detected".uppercased())
                settingBlock(icon: "sparkle", title: "Upgrades", subTitle: "3 Upgrades Available".uppercased())
            })
            
        }
    }
}


struct settingBlock: View {
    var icon: String
    var title: String
    var backgroundColor: Color = Color.white.opacity(0.05)
    var subTitle: String
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 0){
            Image(systemName: icon)
            VStack(alignment: .leading, spacing: 2){
                Text(title)
                    .fontWeight(.semibold)
                    .font(.system(size: 16, weight: .medium, design: .default))
                
                    Text(subTitle)
                        .font(.system(size: 8, weight: .medium, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                       
                
            }
            .padding(.leading, 5)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.1), lineWidth: 0.5))
    }
}
struct reorderButton: View {
    var body: some View {
        
        Button(action: {} ) {
            Text("Reorder Groups")
                .font(.caption)
                .padding(.vertical, 8)
                .padding(.horizontal, 14)
                .background(Color.white.opacity(0.05))
                .clipShape(Capsule())
        }
        
    }
}
#Preview {
    
    ContentView()
    
}
