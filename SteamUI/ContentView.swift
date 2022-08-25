//
//  ContentView.swift
//  SteamUI
//
//  Created by Temiloluwa on 25/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            Home().tabItem {
                
                Image(systemName: "house")
                
            }
            Text("Search").tabItem {
                
                Image("search")
                
            }
            Text("Person").tabItem {
                
                Image(systemName: "person.fill")
                
            }
            Text("Bookmark").tabItem {
                
                Image(systemName: "bookmark")
                
            }
        }.accentColor(.white)
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    var body : some View {
        
        VStack(spacing: 15) {
            
            HStack {
                
                
                //Text("$89")
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("Cart")
                    
                }
            }.overlay(Image("Logo"))
            
            ScrollView(.vertical, showsIndicators: false) {
                
                topView().padding(.vertical, 15)
                MiddleView()
                BottomView().padding(.top, 15)
                
            }
            
            
        }.padding()
        
    }
}
struct topView: View {
    
    @State var show = false
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: 15){
            
            Text("Featured").font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(top,id: \.self){ i in
                        
                        Image(i).onTapGesture {
                            
                            
                            self.show.toggle()
                        }
                    }
                }
            }.padding(.top, 15)
            
        }.sheet(isPresented: $show) {
            
            Details()
        }
    }
}
struct MiddleView: View {
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: 15){
            
            Text("Now on Stream").font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(middle,id: \.self){ i in
                        
                        Image(i)
                    }
                }
            }.padding(.top, 15)
            
        }
    }
}
struct BottomView: View {
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: 15){
            
            Text("Recommended").font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(bottom,id: \.self){ i in
                        
                        Image(i)
                    }
                }
            }.padding(.top, 15)
            
        }
    }
}

struct Details: View {
    
    @State var selected = "About"
    
    var body : some View {
        
        VStack(spacing: 0) {
            
            Image("Header")
            
            Spacer()
            
            ZStack{
                
                VStack(spacing: 20) {
                    
                    HStack(spacing: 25) {
                        
                        Button(action: {
                            
                            self.selected = "About"
                            
                        }) {
                            
                            Text("About").padding(.vertical, 15).padding(.horizontal, 22)
                        }.background(self.selected == "About" ? Color("Color") : Color.clear)
                            .foregroundColor(self.selected == "About" ? .white : Color.gray)
                            .cornerRadius(15)
                        
                        Button(action: {
                            
                            self.selected = "Media"
                            
                        }) {
                            
                            Text("Media").padding(.vertical, 15).padding(.horizontal, 22)
                        }.background(self.selected == "Media" ? Color("Color") : Color.clear)
                            .foregroundColor(self.selected == "Media" ? .white : Color.gray)
                            .cornerRadius(15)
                        
                    }.padding(.top, 15)
                    if self.selected == "About" {
                        
                        About()
                    }
                    else {
                        
                        Media()
                    }
                }
                
            }.background(Rounded().fill(Color.black))
                .padding(.top, -15 )
                .edgesIgnoringSafeArea(.bottom)
        }
    }
    
}
struct About : View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            Text("Welcome to San Francisco the birthplace of technological revolution. Play as young marcus a brillant hacker and join DedSec, the most celebrated Hacker Group Your Goal: the largest Hacking operation in History").padding(.vertical, 15)
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("More about this game ")
                }
            }
            
            Text("system Requirement").padding(.vertical, 15)
            
            
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 10) {
                    
                    Image("min")
                    
                    Text("Minimum requirement")
                }
            }
            Button(action: {
                
            }) {
                
                HStack(spacing: 10) {
                    
                    Image("max")
                    
                    Text("Maximum requirement")
                }
                
            }.padding(.top, 15)
            
            Spacer()
            
        }.padding(.horizontal, 25)
            .foregroundColor(Color.white.opacity(0.6))
    }
}
struct Rounded: Shape{
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 25, height: 25))
        
        return Path(path.cgPath)
    }
    
}
struct Media : View {
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: 15){
            
            Text("Images").font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(detail,id: \.self){ i in
                        
                        Image(i)
                    }
                }
            }.padding(.top, 15)
            
            Text("Videos")
            
            ZStack {
                
                Image("d3")
                
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "play.circle.fill").font(.largeTitle)
                }.foregroundColor(.white)
                
            }.padding(.top, 15)
            Spacer()
            
        }.padding(.horizontal, 25)
            .foregroundColor(.white)
    }
}

// sample data.....

var top = ["Card1","Card2"]
var middle = ["m1","m2","m3"]
var bottom = ["b1","b2","b3"]
var detail = ["d1","d2"]
// self.top.identified(by: \.name))
