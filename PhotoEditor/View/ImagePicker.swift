//
//  ImagePicker.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 19.05.2022.
//

import SwiftUI

public struct ImagePickerView: UIViewControllerRepresentable {
    
    public func makeCoordinator() -> Coordinator {
                return ImagePickerView.Coordinator(parent: self)
    }
    

        @Binding var showPicker: Bool
        @Binding var imageData: Data
    

    public func makeUIViewController(context: Context) -> UIImagePickerController {
                let controller = UIImagePickerController()
                controller.sourceType = .photoLibrary
                controller.delegate = context.coordinator
        
                return controller
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}


    final public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

       // getting Parent ciew context to update image data
                var parent: ImagePickerView
        
                init(parent: ImagePickerView){
                    self.parent = parent
                }

        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let imageData = (info[.originalImage] as? UIImage)?.pngData(){
                         parent.imageData = imageData
                          parent.showPicker.toggle()
                      }
        }

        public func imagePickerControllerDidCancel(_: UIImagePickerController) {
            parent.showPicker.toggle()
        }

    }

}


