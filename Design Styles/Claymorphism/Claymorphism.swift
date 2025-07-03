//
//  Claymorphism.swift
//  DesignStyles
//
//  Created by Ligen Raj on 21/06/25.
//

import SwiftUI

fileprivate struct ClaymorphicModifier<S: Shape>: ViewModifier {
    
    let shape: S
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .background(color, in: shape)
            .innerShadow(using: shape, color: .white.opacity(0.3), radius: 4, x: 4, y: 4)
            .innerShadow(using: shape, color: .black.opacity(0.2), radius: 4, x: -4, y: -4)
            .shadow(color: color.opacity(0.5), radius: 8, x: 8, y: 12)
    }
}

extension View {
    
    func claymorphism<S: Shape>(using shape: S, color: Color) -> some View {
        modifier(ClaymorphicModifier(shape: shape, color: color))
    }
    
}
