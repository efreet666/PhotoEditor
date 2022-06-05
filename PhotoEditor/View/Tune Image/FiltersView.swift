//
//  FiltersView.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 28.05.2022.
//

import CoreImage
import CoreImage.CIFilterBuiltins

import SwiftUI

struct FiltersView: View {
    @State private var showImagePicker = false
    
    @State private var inputImage: UIImage?
    @State private var processedImage:UIImage?
    
    @State private var image:Image?
    
//    @State private var blurEffectSlider:Float = 0
//    @State private var sepiaEffectSlider:Float = 0
    
    //
    @State private var blurIntensity: CGFloat = 0
    @State private var hueAdjust: Double = 0
    @State private var contrastAdjust: Double = 1
    @State private var opacityAdjust: Double = 1
    @State private var brightnessAdjust: Double = 0
    @State private var saturationAdjust: Double = 1
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    
                    
                    if image != nil{
                        VStack{
                            image?
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .opacity(opacityAdjust)
                                .hueRotation(Angle(degrees: hueAdjust))
                                .brightness(brightnessAdjust)
                                .contrast(contrastAdjust)
                                .saturation(saturationAdjust)
                                .blur(radius: blurIntensity)
                            
                            // Adjust blur intensity
                            HStack(spacing: 20) {
                                Text("Blur:")
                                    .foregroundColor(Color(.systemBlue))
                                
                                Slider(value: $blurIntensity, in: 0...10)
                                    
                            }.padding(.horizontal, 50)
                            
                            HStack(spacing: 20) {
                                Text("Brightness:")
                                    .foregroundColor(Color(.systemBlue))
                                
                                Slider(value: $brightnessAdjust, in: 0...1)
                            }.padding(.horizontal, 50)
                            
                            // Adjust contrast
                            HStack(spacing: 20) {
                                Text("Contrast:")
                                    .foregroundColor(Color(.systemBlue))
                                
                                Slider(value: $contrastAdjust, in: 0...1)
                                    
                            }.padding(.horizontal, 50)
                            
                            // Adjust saturation
                            HStack(spacing: 20) {
                                Text("Saturation:")
                                    .foregroundColor(Color(.systemBlue))
                                
                                Slider(value: $saturationAdjust, in: 0...1)
                                    
                            }.padding(.horizontal, 50)
                            
                            // Adjust huerotation
                            HStack(spacing: 20) {
                                Text("Rotate Chroma:")
                                    .foregroundColor(Color(.systemBlue))
                                
                                Slider(value: $hueAdjust, in: 0...90)
                                    
                            }.padding(.horizontal, 50)
                            
                            // Adjust opacity
                            HStack(spacing: 20) {
                                Text("Transparency:")
                                    .foregroundColor(Color(.systemBlue))
                                
                                Slider(value: $opacityAdjust, in: 0...1)
                                    
                            }.padding(.horizontal, 50)
                        }
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color.gray.opacity(0.2)))
                    }
                    else{
                        Text("No Image Selected")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                    
                    
                }
                //            .navigationTitle(Text("Photo Editor"))
                //            .padding()
                //            .foregroundColor(.blue)
            } 
            .toolbar(content: {
    
                        ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            showImagePicker.toggle()
                        }, label: {
                            Image(systemName: "photo.fill.on.rectangle.fill")
                                .foregroundColor(.blue)
                        })
                            .font(.title)
                            .sheet(isPresented: $showImagePicker,onDismiss: loadImage ,content: {
                                ImagePicker(image: $inputImage)
                            })}
                           
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {
                            UIImageWriteToSavedPhotosAlbum(processedImage!, nil, nil, nil)
                        }, label: {
                            Text("Save")
                                .foregroundColor(.blue)
                        })
                        
                            .font(.title)
                    }
                    
                    
                        
                  
        
                
            
            })
            .navigationTitle("Filters")
                .foregroundColor(.blue)
        }
        
    }
    
//    func applyEffect() {
//        let context = CIContext()
//        let blur = CIFilter.gaussianBlur()
//        blur.inputImage = CIImage(image: inputImage!)
//        blur.radius = blurEffectSlider
//
//        let vibrance = CIFilter.vibrance()
//        vibrance.inputImage = CIImage(image: inputImage!)
//        //vibrance.
//
//
//        let sepia = CIFilter.sepiaTone()
//        sepia.inputImage = CIImage(image: inputImage!)
//        sepia.intensity = sepiaEffectSlider
//
//        sepia.setValue(blur.outputImage, forKey: "inputImage")
//        if let output = sepia.outputImage{
//            if let cgimg = context.createCGImage(output, from: output.extent){
//                let processedUIImage = UIImage(cgImage: cgimg)
//                image = Image(uiImage: processedUIImage)
//                processedImage = processedUIImage
//            }
//        }
//    }
    
    func loadImage(){
        guard let inputImage = inputImage else {
            return
        }
        image = Image(uiImage: inputImage)
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
