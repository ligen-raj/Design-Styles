//
//  Glassmorphism.swift
//  DesignStyles
//
//  Created by Ligen Raj on 21/06/25.
//

import SwiftUI

fileprivate struct GlassmorphicModifier<S: Shape>: ViewModifier {
    
    @Environment(\.colorScheme) private var colorScheme
    private var gradientColors: [Color] {
//        1, 0.1, 0.1, 0.4, 0.5
        [color(1), color(0.1), .clear, color(0.4), color(0.5)]
    }
    
    let shape: S
    let color: Color?
    
    func body(content: Content) -> some View {
        content
            .background(alignment: .center, content: BackgroundContent)
            .overlay(alignment: .center, content: StrokeContent)
            .shadow(color: .primary.opacity(0.1), radius: 5, x: 5, y: 5)
    }
    
    private func BackgroundContent() -> some View {
        shape
            .fill(.ultraThinMaterial)
            .background((color ?? .clear).opacity(0.3), in: shape)
            .innerShadow(using: shape, color: .black.opacity(colorScheme == .dark ? 0.2 : 0.1))
    }
    
    private func StrokeContent() -> some View {
        shape
            .stroke(LinearGradient(colors: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1.5)
    }
    
    private func color(_ value: CGFloat) -> Color {
        .white.opacity(colorScheme == .dark ? value * 0.4 : value)
    }
    
}

extension View {
    
    func glassmorphism<S: Shape>(using shape: S, color: Color? = nil) -> some View {
        modifier(GlassmorphicModifier(shape: shape, color: color))
    }
    
}
