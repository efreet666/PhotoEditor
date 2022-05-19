//
//  ImageEditor.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 19.05.2022.
//

import SwiftUI

struct ImageEditor: View {
    @StateObject var model = DravingViewModel()
    var body: some View {
       
        NavigationView{
            VStack{
                if UIImage(data: model.imageData) != nil{
                    
                    DrawingScreen()
                        .environmentObject(model)
                        
                    
//                    Image(uiImage: imageFile)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                      
                    
                    
                    //cancel button
                    
                        .toolbar(content: {
                            ToolbarItem(placement: .navigationBarLeading) {
                            
                            Button(action: model.cancelImageEdition, label: { Image(systemName: "xmark")
                                    .colorInvert()
                                
                            })
                        
                    }
                            
                        
                        })
                } else {
                    
                    Button(action: {model.showImagePicker.toggle()}, label: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: -5)
                        
                    })
                }
            }
            .navigationTitle("Image Editor")
            
        }
        
        .sheet(isPresented: $model.showImagePicker, content: {
            ImagePickerView(showPicker: $model.showImagePicker, imageData: $model.imageData)
                
        })
    }
}

struct ImageEditor_Previews: PreviewProvider {
    static var previews: some View {
        ImageEditor()
    }
}