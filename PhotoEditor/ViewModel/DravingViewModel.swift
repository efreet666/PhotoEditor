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
    
    @Published var currentIndex: Int = 0
    
    
    //cancel function
    func cancelImageEdition(){
        imageData = Data(count: 0)
        canvas = PKCanvasView()
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
        textBoxes.removeLast()
    }
}


