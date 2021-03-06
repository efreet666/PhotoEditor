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
       
        ZStack{
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
                                        .foregroundColor(Color.blue)
                                    
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
            
            if model.addNewBox{
                Color.black.opacity(0.75)
                    .ignoresSafeArea()
                
                //textField
                TextField("Ввод", text: $model.textBoxes[model.currentIndex].text)
                    .font(.system(size: 35, weight: model.textBoxes[model.currentIndex].isBold ? .bold : .regular) )
                    .colorScheme(.dark)
                    .foregroundColor(model.textBoxes[model.currentIndex].textColor)
                    .padding()
                
                //add and cancel button
                HStack{
                    Button(action: {
                        //toggling the isAdded
                        model.textBoxes[model.currentIndex].isAdded = true
                        
                        //closing the view
                        withAnimation {
                            model.toolPicker.setVisible(true, forFirstResponder: model.canvas)
                            model.canvas.becomeFirstResponder()
                            model.addNewBox = false
                            
                        }
                        
                    }, label: {
                        Text("Add")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                    })
                    
                    Spacer()
                    
                    Button(action: model.cancelTextView
                    , label: {
                        Text("Cancel")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                    })
                }.padding()
                    .offset(y: 20)
                
                .overlay(
                    HStack(spacing: 15){
                        //color picker
                         ColorPicker("", selection: $model.textBoxes[model.currentIndex].textColor)
                                 .labelsHidden()
                        
                        Button(action: {
                            model.textBoxes[model.currentIndex].isBold.toggle()
                        }, label: {
                            Text(model.textBoxes[model.currentIndex].isBold ? "Normal" : "Bold")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        })
                    }
                        .padding()
                            .offset(y: 20)
                )
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        
        .sheet(isPresented: $model.showImagePicker, content: {
            ImagePickerView(showPicker: $model.showImagePicker, imageData: $model.imageData)
                
        })
        .alert(isPresented: $model.showAlert, content: {
            Alert(title: Text("Уведомление"), message: Text(model.message), dismissButton: .destructive(Text("Ok")))
        })
    }
}

struct ImageEditor_Previews: PreviewProvider {
    static var previews: some View {
        ImageEditor()
    }
}
