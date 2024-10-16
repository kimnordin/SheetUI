//
//  ViewHeightReader.swift
//  SheetUI
//
//  Created by Kim on 2024-10-16.
//

import SwiftUI

struct ViewHeightReader: ViewModifier {
    @Binding var height: CGFloat

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geometry -> Color in
                DispatchQueue.main.async {
                    height = geometry.size.height
                }
                return Color.clear
            }
        )
    }
}
