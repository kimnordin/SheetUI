//
//  ViewModifiers.swift
//  SheetUI
//
//  Created by Kim on 2024-10-16.
//

import SwiftUI

extension View {
    public func dynamicSheet<SheetContent: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> SheetContent) -> some View {
        self.modifier(DynamicSheet(isPresented: isPresented, sheetContent: content))
    }
    
    internal func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}
