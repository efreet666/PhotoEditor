//
//  Drawing screen.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 19.05.2022.
//

import SwiftUI
import PencilKit

struct DrawingScreen: View {
    @EnvironmentObject var model: DravingViewModel
    
    var body: some View {
        ZStack{
        
            GeometryReader{proxy -> AnyView in
                let size = proxy.frame(in: .global).size
                
                return AnyView(
                    
                    // UIKit Pencil Kit Drawing
                    CanvasView(canvas: $model.canvas, imageData: $model.imageData, toolPicker: $model.toolPicker, rect: size)
                    )
                
            }
            
        }
    }
}

struct Drawing_screen_Previews: PreviewProvider {
    static var previews: some View {
        ImageEditor()
    }
}

struct CanvasView: UIViewRepresentable{

    @Binding var canvas: PKCanvasView
    @Binding var imageData: Data
    @Binding var toolPicker: PKToolPicker
    
    var rect: CGSize
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.isOpaque = false
        canvas.backgroundColor = .clear
        canvas.drawingPolicy = .anyInput
        
        //appending the iamge in canvas subview
        if let image = UIImage(data: imageData){
            
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            
            let subView = canvas.subviews[0]
            subView.addSubview(imageView)
            subView.sendSubviewToBack(imageView)
            
            toolPicker.setVisible(true, forFirstResponder: canvas)
            toolPicker.addObserver(canvas)
            canvas.becomeFirstResponder()
        }
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
       
    }
    
}
