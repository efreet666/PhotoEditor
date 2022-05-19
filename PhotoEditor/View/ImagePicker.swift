//
//  ImagePicker.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 19.05.2022.
//

import SwiftUI


////Bilding image picker using UIKit
//struct ImagePicker1: UIViewControllerRepresentable {
//
//    @Binding var showPicker: Bool
//    @Binding var imageData: Data
//
//    func makeCoordinator() -> Coordinator {
//        return ImagePicker1.Coordinator(parent: self)
//    }
//
//    func makeUIViewController(context: Context) -> some UIImagePickerController {
//
//        let controller = UIImagePickerController()
//        controller.sourceType = .photoLibrary
//        controller.delegate = context.coordinator
//
//        return controller
//    }
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
//
//    }
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
//
//        //getting Parent ciew context to update image data
//        var parent: ImagePicker1
//
//        init(parent: ImagePicker1){
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//            if let imageData = (info[.originalImage] as? UIImage)?.pngData(){
//                parent.imageData = imageData
//                parent.showPicker.toggle()
//            }
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            //closing the view if cancelled
//            parent.showPicker.toggle()
//        }
//    }
//}

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


