//
//  NavigationBar.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 18.05.2022.
//

import SwiftUI

struct NavigationBar: View {
    
    var title = ""
    @Binding var hasScrolled: Bool
    
    var body: some View {
        ZStack {
            Color.clear
                .background(MaterialEffect(style:
                                                .systemUltraThinMaterial))
                .blur(radius: 4)
                .offset(y: -10)
                .ignoresSafeArea()
                .opacity(hasScrolled ? 1 : 0)
            
            Text(title)
                .animatableFont(size: hasScrolled ? 22: 34, weight: .bold)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
            
            HStack(spacing: 16){
                if #available(iOS 15.0, *) {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 36, height: 36)
                        .foregroundColor(.secondary)
                        .background(.ultraThinMaterial, in:
                                        RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .cornerRadius(14)
                    
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                        .frame(width: 36, height: 36)
                        .foregroundColor(.secondary)
                        .background(.ultraThinMaterial, in:
                                        RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .cornerRadius(14)
                        
                }
                   
                else {
                    // Fallback on earlier versions
                }
                
                   
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasScrolled ? -4 : 0)
            
        }
        .frame(height: hasScrolled ? 44 : 70)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_PriviewNavigationBar: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Home", hasScrolled: .constant(false))
    }
}

