//
//  DynamicSheet.swift
//  SheetUI
//
//  Created by Kim on 2024-10-16.
//

import SwiftUI

struct DynamicSheetModifier<SheetContent: View>: ViewModifier {
    @State private var contentHeight: CGFloat = .zero
    @State private var dragOffset: CGFloat = .zero
    @State private var isVisible: Bool = false
    @Binding var isPresented: Bool
    
    let sheetContent: () -> SheetContent
    
    private var scrollThreshold: CGFloat {
        return contentHeight / 2
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(SheetOverlay)
            .onAppear() {
                if isPresented {
                    displaySheet()
                }
            }
            .onChange(of: isPresented) { presented in
                if presented {
                    displaySheet()
                } else {
                    dismissSheet()
                }
            }
    }
    
    @ViewBuilder private var SheetOverlay: some View {
        if isVisible {
            ZStack {
                VStack {
                    Spacer()
                    SheetView
                }
                .ignoresSafeArea(edges: .bottom)
            }
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
        .background(.white)
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .offset(y: dragOffset)
        .gesture(dragGesture())
        .animation(.easeInOut(duration: 0.3), value: dragOffset)
    }
    
    private func displaySheet() {
        isVisible = true
        withAnimation {
            dragOffset = 0
        }
    }
    
    private func dismissSheet() {
        withAnimation {
            dragOffset = contentHeight
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isVisible = false
        }
    }
    
    private func dragGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                let maxHeight = contentHeight - value.translation.height
                if maxHeight > contentHeight {
                    dragOffset = 0
                } else {
                    contentHeight = contentHeight
                    dragOffset = value.translation.height
                }
            }
            .onEnded { value in
                if dragOffset > scrollThreshold {
                    isPresented = false
                } else {
                    withAnimation {
                        dragOffset = 0
                        contentHeight = contentHeight
                    }
                }
            }
    }
}
