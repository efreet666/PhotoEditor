//
//  DravingViewModel.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 19.05.2022.
//

import SwiftUI
import PencilKit

class DravingViewModel: ObservableObject {
  
    @Published var showImagePicker = false
    @Published var imageData: Data = Data(count: 0)
    
    //canvas for drawing...
    @Published var canvas = PKCanvasView()
    
    //tool picker
    @Published var toolPicker = PKToolPicker()
    
    //list of TextBoxes
    @Published var textBoxes : [TextBox] = []
    
    @Published var addNewBox = false
    
    //current index
    @Published var currentIndex: Int = 0
    
    //savingthe view frame size
    @Published var rect: CGRect = .zero
    
    //alert
    @Published var showAlert = false
    @Published var message = ""
    
    //cancel function
    func cancelImageEdition(){
        imageData = Data(count: 0)
        canvas = PKCanvasView()
        textBoxes.removeAll()
    }
    
    //cancel the text view
    func cancelTextView(){
        
        //showing again the tool bar
        toolPicker.setVisible(true, forFirstResponder: canvas)
        canvas.becomeFirstResponder()
        withAnimation{
            addNewBox  = false
        }
        
        //removing if cancelled
        if !textBoxes[currentIndex].isAdded{
            textBoxes.removeLast()
        }
        
    }
    
    func saveImage(){
        
        //generating image from both canvas and our textboxes view
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        //canvas
        canvas.drawHierarchy(in: CGRect(origin: .zero, size: rect.size), afterScreenUpdates: true)
        
        let SwiftUIView = ZStack{
            
            ForEach(textBoxes){ [self] box in
                
                Text(textBoxes[currentIndex].id == box.id && addNewBox ? "" : box.text)
                    .font(.system(size: 30))
                    .fontWeight(box.isBold ? .bold : .none )
                    .foregroundColor(box.textColor)
                    .offset(box.offset)
                
        }
        }
        
        let controller = UIHostingController(rootView: SwiftUIView).view!
        controller.frame = rect
        
        
        //clearing bg
        controller.backgroundColor = .clear
        canvas.backgroundColor = .clear
        
        
        controller.drawHierarchy(in: CGRect(origin: .zero, size: rect.size), afterScreenUpdates: true)
        //getting image
        let generetedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        //ending render
        UIGraphicsEndImageContext()
        
        if let image = generetedImage?.pngData(){
            //saving image
            UIImageWriteToSavedPhotosAlbum(UIImage(data: image)!, nil, nil, nil)
            self.message = "Фото сохранено"
            self.showAlert.toggle()
        }
    }
}


