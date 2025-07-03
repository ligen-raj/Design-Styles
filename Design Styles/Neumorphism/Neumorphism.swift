//
//  Neumorphism.swift
//  DesignStyles
//
//  Created by Ligen Raj on 22/06/25.
//

import SwiftUI

enum NeumorphicStyle {
    case `in`, out, reverse
}

fileprivate struct NeumorphicModifier<S: Shape>: ViewModifier {
    
    let shape: S
    let color: Color
    let style: NeumorphicStyle
    
    func body(content: Content) -> some View {
        content
            .background(alignment: .center, content: BackgroundContent)
    }
    
    @ViewBuilder func BackgroundContent() -> some View {
        switch style {
        case .in:
            shape
                .fill(color)
                .innerShadow(using: shape, color: .black.opacity(0.2), radius: 4, x: 4, y: 4)
                .innerShadow(using: shape, color: .white.opacity(0.2), radius: 4, x: -4, y: -4)
        case .out:
            shape
                .fill(color)
                .shadow(color: .black.opacity(0.2), radius: 4, x: 4, y: 4)
                .shadow(color: .white.opacity(0.2), radius: 4, x: -4, y: -4)
        case .reverse:
            shape
                .fill(color)
                .shadow(color: .white.opacity(0.2), radius: 4, x: 4, y: 4)
                .shadow(color: .black.opacity(0.2), radius: 4, x: -4, y: -4)
        }
    }
    
}

extension View {
    
    func neumorphism<S: Shape>(using shape: S, color: Color, style: NeumorphicStyle) -> some View {
        modifier(NeumorphicModifier(shape: shape, color: color, style: style))
    }
    
}

struct NeumorphicButtonStyle<S: Shape>: ButtonStyle {
    
    let shape: S
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .neumorphism(using: shape, color: color, style: configuration.isPressed ? .reverse : .out)
    }
}
