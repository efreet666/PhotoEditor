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
    var body: some View {
        TabView(selection: $currentTab){
            Text("Home")
                .tag(Tab.Home)
            
            Text("Search")
                .tag(Tab.Search)
            
            Text("Message")
                .tag(Tab.Message)
            
            Text("Account")
                .tag(Tab.Account)
            
        }
        
        //curvedTabBar
        .overlay(
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.rawValue){ tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafearea().bottom == 0 ? 10:
                            getSafearea().bottom - 10)
                .background(MaterialEffect(style: .systemUltraThinMaterialDark))
            },
            alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
        .preferredColorScheme(.dark)
        
        
        
    }
    
    //tabButton
    @ViewBuilder func TabButton(tab: Tab) -> some View {
        
        Button{
            withAnimation(.spring()){
                currentTab = tab
            }
            
        } label: {
            Image(systemName: tab.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .frame(maxWidth: .infinity)
            .foregroundColor(.white)}
        
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
