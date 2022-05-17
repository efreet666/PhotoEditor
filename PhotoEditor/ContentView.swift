//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    // current tab
    @State var currentTab: Tab = .Home
    
    //Hidden native one
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    //Matched geometry effect
    @Namespace var animation
    
    @State var currentXValue: CGFloat = 0
    
    var body: some View {
        TabView(selection: $currentTab){
            
            
            MainView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
               // .background(Color("red")).ignoresSafeArea()

                .tag(Tab.Home)
            
            SampleCards(color: .purple, count: 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG")).ignoresSafeArea()
                .tag(Tab.Search)
            
            Text("Message")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG")).ignoresSafeArea()
                .tag(Tab.Message)
            
            Text("Account")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BG")).ignoresSafeArea()
                .tag(Tab.Account)
            
        }
        
        //curvedTabBar
        .overlay(
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue){ tab in
                    TabButton(tab: tab)
                }
            }
                .padding(.vertical)
                .padding(.bottom, getSafearea().bottom == 0 ? 10:
                            getSafearea().bottom - 10)
                .background(
                    MaterialEffect(style:
                                        .systemUltraThinMaterialDark)
                        .clipShape(BottomCurve(currentXValue: currentXValue)))
            
            ,
            alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
        
        //Scheme
        .preferredColorScheme(.light)
        
    }
    
    //simple cards
    @ViewBuilder func SampleCards(color: Color, count: Int) -> some View{
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15){
                    
                    ForEach(1...count, id: \.self){index in
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color)
                            .frame(height: 250)
                        
                        
                    }
                }
                .padding()
                .padding(.bottom, 60)
                .padding(.bottom,getSafearea().bottom == 0 ? 15 : getSafearea().bottom)
            }
            .navigationBarTitle("Home")
        }
        
    }
    
    @ViewBuilder func MainView() -> some View{
        
        
        ZStack{
            
            MaterialEffect(style: .systemUltraThinMaterial)
                .frame(height: 250)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 10)
                .padding(.all, 20.0)
                
            VStack{
                
                Image("image1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 330)
                    .offset(x: 0, y: -30)
                   
                
                HStack{
                    
                    Image("edit")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        
                       
                    Text("Edit photo")
                        .font(.largeTitle)
                    
                        // .font(Font.custom("SF-Pro-Display-Black", size: 32))
                        
                     //   .fontWeight(.semibold)
                        
                    
                } .offset(x: 0, y: -35)
            }
                
            
            
            
        }.background(Image("Blob 1 Dark").offset(x: 200, y: -150))
      //  .padding()
     
        
    }
    
    
    
    //tabButton
    @ViewBuilder func TabButton(tab: Tab) -> some View {
        
        GeometryReader{ proxy in
            
            Button{
                withAnimation(.spring()){
                    currentTab = tab
                    
                    //updateValue
                    currentXValue = proxy.frame(in: .global).midX
                }
                
                
            } label: {
                
                //moving button up for current page
                
                Image(systemName: tab.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(currentTab == tab ? 15: 0)
                    .background(
                        ZStack{
                            if currentTab == tab{
                                
                                MaterialEffect(style: .systemChromeMaterialDark)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                        
                    )
                    .contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -50 : 0)
                
                //setting initial curve position
                    .onAppear{
                        if tab == Tab.allCases.first && currentXValue == 0 {
                            currentXValue = proxy.frame(in: .global).midX
                        }
                    }
            }
        }
        .frame(height: 30)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//enum for Tab
enum Tab: String, CaseIterable{
    case Home = "house.fill"
    case Search = "magnifyingglass"
    case Message = "bell.fill"
    case Account = "person.fill"
}

//getting safe area
func getSafearea() -> UIEdgeInsets{
    guard let screen =
            UIApplication.shared.connectedScenes.first as?
            UIWindowScene else {
                return .zero
            }
    
    guard let safeArea = screen.windows.first?.safeAreaInsets
    else {
        return .zero
    }
    return safeArea
}
