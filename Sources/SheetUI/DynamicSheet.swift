//
//  DynamicSheet.swift
//  SheetUI
//
//  Created by Kim on 2024-10-16.
//

import SwiftUI

internal struct DynamicSheet<SheetContent: View>: ViewModifier {
    @State private var contentHeight: CGFloat = .zero
    @State private var dragOffset: CGFloat = .zero
    @Binding var isPresented: Bool
    
    let backgroundColor: Color
    let safeAreaEdges: Edge.Set
    let sheetContent: () -> SheetContent
    
    private var scrollThreshold: CGFloat {
        return contentHeight / 2
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(SheetOverlay)
            .animation(.easeInOut(duration: 0.3), value: isPresented)
            .onChange(of: isPresented) {
                if !$0 {
                    dragOffset = 0
                }
            }
    }
    
    @ViewBuilder private var SheetOverlay: some View {
        if isPresented {
            VStack {
                Spacer()
                SheetView
            }
            .ignoresSafeArea(edges: safeAreaEdges)
            .transition(.move(edge: .bottom))
        }
    }
    
    @ViewBuilder private var SheetView: some View {
        GeometryReader { outerGeometry in
            VStack {
                sheetContent()
                    .modifier(ViewHeightReader(height: $contentHeight))
            }
        }
        .frame(height: contentHeight)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .offset(y: dragOffset)
        .gesture(dragGesture())
    }
    
    private func dragGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                dragOffset = max(0, value.translation.height)
            }
            .onEnded { value in
                if dragOffset > scrollThreshold {
                    isPresented = false
                } else {
                    withAnimation {
                        dragOffset = 0
                    }
                }
            }
    }
}
