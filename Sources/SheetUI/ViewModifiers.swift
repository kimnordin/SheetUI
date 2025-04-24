//
//  ViewModifiers.swift
//  SheetUI
//
//  Created by Kim on 2024-10-16.
//

import SwiftUI

extension View {
    /**
     Presents a sheet when a binding to a Boolean value that you provide is true.
     - parameter isPresented: A binding  Boolean value that determines whether to present the sheet.
     - parameter backgroundColor: The background color to apply to the sheet.
     - parameter edges: The set of edges to ignore.
     - parameter content: A closure returning the content of the sheet.
     */
    public func dynamicSheet<SheetContent: View>(isPresented: Binding<Bool>, backgroundColor: Color = .clear, ignoresSafeArea edges: Edge.Set = [], @ViewBuilder content: @escaping () -> SheetContent) -> some View {
        self.modifier(DynamicSheet(isPresented: isPresented, backgroundColor: backgroundColor, safeAreaEdges: edges, sheetContent: content))
    }
    
    internal func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}
