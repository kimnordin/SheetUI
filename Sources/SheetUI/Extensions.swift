//
//  Extensions.swift
//  SheetUI
//
//  Created by Kim on 2026-01-12.
//

import SwiftUI

extension Binding {
    /**
     Converts an optional binding into a presentation binding.
     - `true` when the value *isn't* `nil`.
     - `false` when the value *is* `nil`.
     */
    @MainActor func isPresented<T>() -> Binding<Bool> where Value == T? {
        return Binding<Bool> {
            self.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                self.wrappedValue = nil
            }
        }
    }
}
