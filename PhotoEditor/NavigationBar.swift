//
//  NavigationBar.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 18.05.2022.
//

import SwiftUI

struct NavigationBar: View {
    
    var title = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .background(MaterialEffect(style:
                                                .systemUltraThinMaterial))
                .blur(radius: 2)
                .ignoresSafeArea()
            
            
            Text(title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
        }
            .frame(height: 70)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_PriviewNavigationBar: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}

