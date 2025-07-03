//
//  InnerShadow.swift
//  DesignStyles
//
//  Created by Ligen Raj on 21/06/25.
//

import SwiftUI

struct InnerShadow<S: Shape>: ViewModifier {
    
    let shape: S
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .center, content: OverlayContent)
    }
    
    func OverlayContent() -> some View {
        shape
            .stroke(color, lineWidth: radius * 2)
            .blur(radius: radius)
            .offset(x: x, y: y)
            .mask(shape)
//            .stroke(color, lineWidth: radius)
//            .padding(-radius * 0.5)
//            .shadow(color: color, radius: radius, x: x, y: y)
//            .clipShape(shape)
    }
    
}

extension View {
    
    func innerShadow<S: Shape>(using shape: S, color: Color = .primary.opacity(0.3), radius: CGFloat = 4, x: CGFloat = 0, y: CGFloat = 0) -> some View {
        self
            .modifier(InnerShadow(shape: shape, color: color, radius: radius, x: x, y: y))
    }
    
}

#Preview {
    let shape: Capsule = Capsule()
    
    Text("Hello World!!")
        .padding()
        .background {
            shape
                .fill(.green)
                .innerShadow(using: shape, color: .primary.opacity(0.3), radius: 2, x: 2, y: 2)
                .innerShadow(using: shape, color: .white.opacity(0.3), radius: 2, x: -2, y: -2)
        }
        .foregroundStyle(.white)
}
