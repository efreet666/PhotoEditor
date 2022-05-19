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
    
    //cancel function
    func cancelImageEdition(){
        imageData = Data(count: 0)
        showImagePicker.toggle()
        
    }
}


