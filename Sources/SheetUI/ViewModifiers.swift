//
//  ViewModifiers.swift
//  SheetUI
//
//  Created by Kim on 2024-10-16.
//

import SwiftUI

extension View {
    /**
     Presents a sheet when a binding Boolean value is true.
     - parameter isPresented: A binding  Boolean value that determines whether to present the sheet.
     - parameter backgroundColor: The background color to apply to the sheet.
     - parameter edges: The set of edges to ignore.
     - parameter content: A closure returning the content of the sheet.
     */
    public func dynamicSheet<SheetContent: View>(isPresented: Binding<Bool>, backgroundColor: Color = .clear, ignoresSafeArea edges: Edge.Set = [], @ViewBuilder content: @escaping () -> SheetContent) -> some View {
        self.modifier(DynamicSheet(isPresented: isPresented, backgroundColor: backgroundColor, safeAreaEdges: edges, sheetContent: content))
    }
    
    /**
     Presents a sheet when a binding to an optional identifiable value is non-nil.
     - parameter item: A binding to an optional identifiable value that determines whether to present the sheet.
     - parameter backgroundColor: The background color to apply to the sheet.
     - parameter safeAreaEdges: The set of edges to ignore.
     - parameter content: A closure returning the content of the sheet for the provided item.
     */
    public func dynamicSheet<Item: Identifiable, SheetContent: View>(item: Binding<Item?>, backgroundColor: Color = .clear, safeAreaEdges: Edge.Set = [], @ViewBuilder content: @escaping (Item) -> SheetContent) -> some View {
        self.modifier(DynamicSheet(isPresented: item.isPresented(), backgroundColor: backgroundColor, safeAreaEdges: safeAreaEdges) {
            if let value = item.wrappedValue {
                content(value)
            }
        })
    }
    
    internal func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}

