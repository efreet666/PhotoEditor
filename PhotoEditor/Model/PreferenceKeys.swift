//
//  PreferenceKeys.swift
//  PhotoEditor
//
//  Created by Влад Бокин on 18.05.2022.
//

import SwiftUI

struct ScrollPreferenceKeys: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
