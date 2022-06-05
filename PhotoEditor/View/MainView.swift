//
//  MainView.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 17.05.2022.
//

import SwiftUI



@ViewBuilder func MainView() -> some View{
    //Block 1
    VStack{
        ZStack{
            MaterialEffect(style: .systemUltraThinMaterial)
                .frame(height: 260)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
                .padding(.all, 20.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom ))
                        
                        .blendMode(.overlay)
                        .padding()
                        .offset(x: -4 ,y: 4)
                )
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
                        .colorInvert()
                    
                    
                    
                        NavigationLink(destination: {
                            FiltersView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color("BG")).ignoresSafeArea()
                                
                        }, label: {Text("Edit photo")
    })
                            .font(.largeTitle)
                    
                   
                    
                        // .font(Font.custom("SF-Pro-Display-Black", size: 32))
                        
                     //   .fontWeight(.semibold)
                        
                } .offset(x: 0, y: -35)
            }
        }
        
        
        //Block 2
        ZStack{
            
            MaterialEffect(style: .systemUltraThinMaterial)
                .frame(height: 260)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
                .padding(.all, 20.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .stroke(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom ))
                        
                        .blendMode(.overlay)
                        .padding()
                        .offset(x: -4 ,y: 4)
                )
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
                        .colorInvert()
                       
                    Text("button 2")
                        .font(.largeTitle)
                    
                    
                } .offset(x: 0, y: -35)
                
                
            }
        }
    }
    .background(Image("Blob 1 Dark").offset(x: 250, y: -40))
    .offset(x: 0, y: 55)
}

