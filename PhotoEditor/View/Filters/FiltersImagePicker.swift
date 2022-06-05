//
//  FiltersImagePicker.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 28.05.2022.
//

import SwiftUI
import PhotosUI

struct FiltersImagePicker: UIViewControllerRepresentable {
    @Binding var picker: Bool
    @Binding var imageData: Data
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        let picker = PHPickerViewController(configuration: PHPickerConfiguration())
        picker.delegate = context.coordinator
        
        return picker
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate{
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            //checking image is selected
            
            if !
        }
        
        
    }
}


