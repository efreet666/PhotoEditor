//
//  TextBox.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 19.05.2022.
//

import SwiftUI
import PencilKit

struct TextBox: Identifiable {
   
    var id = UUID().uuidString
    var text: String = ""
    var isBold: Bool = false
    //For draggingthe view over
    var offset: CGSize = .zero
    var lastOffset: CGSize = .zero
    var textColor: Color?
}


