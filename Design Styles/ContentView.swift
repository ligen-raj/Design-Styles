//
//  ContentView.swift
//  Design Styles
//
//  Created by Ligen Raj on 03/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

fileprivate struct Claymorphism: View {
    
    // MARK: - PROPERTIES
    
    
    
    // MARK: - BODY
    
    var body: some View {
        
        ZStack(alignment: .center) {
            LinearGradient(colors: [.blue, .clear], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .center, spacing: 16) {
                VStack(alignment: .center, spacing: 16) {
                    Text("Welcome Back")
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundStyle(.blue)
                        .padding(.bottom, -12)
                    
                    Text("Enter your credentials to access your account.")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding(.bottom)
                    
                    CustomTextField(image: "envelope.fill", placeholder: "Enter your email")
                    
                    CustomTextField(image: "key.horizontal.fill", placeholder: "Enter your password")
                    
                    Text("Get Started!!")
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.horizontal)
                        .claymorphism(using: .capsule, color: .blue)
                }
                .padding()
                .padding(.vertical)
                .foregroundStyle(.secondary)
                .claymorphism(using: .rect(cornerRadius: 32), color: .white)
                
                (
                    Text("Forget your password? ") +
                    
                    Text("Reset password")
                        .foregroundColor(.blue)
                )
                .font(.footnote)
                .fontWeight(.medium)
            }
            .padding()
        }
        .ignoresSafeArea(.container, edges: .all)
        
    }
    
    private func CustomTextField(image: String, placeholder: String) -> some View {
        HStack(alignment: .center, spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(.blue.opacity(0.5))
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .overlay(alignment: .center, content: {
                    Image(systemName: image)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                })
            
            Text(placeholder)
                .font(.footnote)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.secondary, in: .rect(cornerRadius: 16).stroke())
    }
    
}

fileprivate struct Glassmorphism: View {
    
    // MARK: - PROPERTIES
    
    
    
    // MARK: - BODY
    
    var body: some View {
        
        ZStack(alignment: .center) {
            Image(.pinkSpline)
                .resizable()
            
            VStack(alignment: .center, spacing: 16) {
                VStack(alignment: .center, spacing: 8) {
                    Image(systemName: "photo.circle.fill")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 8) {
                        Text("Search by image")
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                    }
                    .font(.subheadline.weight(.medium))
                }
                .padding()
                .frame(width: 150, height: 150)
                .glassmorphism(using: .rect(cornerRadius: 16))
                
                Text("Get Started!!")
                    .fontWeight(.medium)
                    .padding()
                    .padding(.horizontal)
                    .glassmorphism(using: .capsule, color: .blue)
            }
            .foregroundStyle(.white)
        }
        .ignoresSafeArea(edges: .all)
        
    }
}

fileprivate struct Neumorphism: View {
    
    // MARK: - PROPERTIES
    
    @State private var seniors: Int = 3
    @State private var adults: Int = 2
    @State private var kids: Int = 1
    @State private var babies: Int = 0
    @State private var isOpen: Bool = false
    
    @Namespace private var namespace
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 24) {
            /// - Tag: Search Bar
            SearchBarView
            
            StepperGroupView
            
            Spacer()
            
            HStack(alignment: .center, spacing: 8) {
                /// - Tag: Segment Control
                HStack(alignment: .center, spacing: 8) {
                    SegmentControl(current: $isOpen, title: "Closed", value: false)
                    
                    SegmentControl(current: $isOpen, title: "Open", value: true)
                }
                .padding(8)
                .neumorphism(using: .capsule, color: .gray, style: .out)
                .animation(.easeIn, value: isOpen)
                
                Spacer()
                
                /// - Tag: Soft Button
                Button(action: {
                    seniors = 3
                    adults = 2
                    kids = 1
                    babies = 0
                    isOpen = false
                }) {
                    Text("Reset All")
                        .foregroundStyle(.red)
                        .padding()
                        .neumorphism(using: .capsule, color: .gray, style: .in)
                }
                .buttonStyle(NeumorphicButtonStyle(shape: .capsule, color: .gray))
            }
        }
        .font(.body.weight(.medium))
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
        
    }
    
    private var SearchBarView: some View {
        HStack(alignment: .center, spacing: 0) {
            TitleView("San Francis", showDivider: true)
                .neumorphism(using: .rect(cornerRadius: 12), color: .gray, style: .in)
            
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .opacity(0.5)
                .padding(8)
        }
        .padding(8)
        .neumorphism(using: .rect(cornerRadius: 16), color: .gray, style: .out)
    }
    
    private var Seperator: some View {
        Rectangle()
            .fill(.black.opacity(0.2))
            .frame(height: 1.5)
            .padding(.horizontal, -8)
    }
    
    private func TitleView(_ title: String, showDivider: Bool = false) -> some View {
        HStack(alignment: .center, spacing: 4) {
            Text(title)
            
            Capsule()
                .fill(.orange)
                .frame(width: 1.5, height: 16)
                .active(if: showDivider)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private func StepperView<Content: View>(title: String, value: Int, @ViewBuilder minusButton: () -> Content, @ViewBuilder plusButton: () -> Content) -> some View {
        HStack(alignment: .center, spacing: 8) {
            TitleView(title)
            
            minusButton()
                .frame(width: 38, height: 38)
            
            Text(value, format: .number)
//                .contentTransition(.numericText())
                .frame(minWidth: 16)
            
            plusButton()
                .frame(width: 38, height: 38)
        }
        .animation(.default, value: value)
    }
    
    private func SegmentControl<T: Equatable>(current: Binding<T>, title: String, value: T) -> some View {
        Button(action: {
            current.wrappedValue = value
        }) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundStyle(current.wrappedValue == value ? .black : .green)
                .padding(.horizontal)
                .padding(.vertical, 12)
                .background {
                    Capsule()
                        .fill(.clear)
                        .neumorphism(using: .capsule, color: .gray, style: .in)
                        .matchedGeometryEffect(id: "SegmentControl", in: namespace)
                        .active(if: current.wrappedValue == value)
                }
        }
        .buttonStyle(.plain)
    }
    
    private func StepperButton1(value: Binding<Int>, increment: Bool) -> some View {
        Button(action: {
            let wrapped = value.wrappedValue
            
            guard increment || wrapped > 0 else { return }
            value.wrappedValue = increment ? wrapped + 1 : wrapped - 1
        }) {
            Image(systemName: increment ? "plus" : "minus")
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .buttonStyle(NeumorphicButtonStyle(shape: .circle, color: .black.opacity(0.5)))
    }
    
    private func StepperButton2(value: Binding<Int>, increment: Bool) -> some View {
        Button(action: {
            let wrapped = value.wrappedValue
            
            guard increment || wrapped > 0 else { return }
            value.wrappedValue = increment ? wrapped + 1 : wrapped - 1
        }) {
            Image(systemName: increment ? "plus" : "minus")
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .neumorphism(using: .circle, color: .gray, style: .in)
        }
        .buttonStyle(.plain)
    }
    
    private func StepperButton3(value: Binding<Int>, increment: Bool) -> some View {
        Button(action: {
            let wrapped = value.wrappedValue
            
            guard increment || wrapped > 0 else { return }
            value.wrappedValue = increment ? wrapped + 1 : wrapped - 1
        }) {
            Image(systemName: increment ? "plus" : "minus")
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .neumorphism(using: .circle, color: .gray, style: .reverse)
        }
        .buttonStyle(.plain)
    }
    
    private func StepperButton4(value: Binding<Int>, increment: Bool) -> some View {
        Button(action: {
            let wrapped = value.wrappedValue
            
            guard increment || wrapped > 0 else { return }
            value.wrappedValue = increment ? wrapped + 1 : wrapped - 1
        }) {
            Image(systemName: increment ? "plus" : "minus")
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .neumorphism(using: .circle, color: .gray, style: .in)
        }
        .buttonStyle(NeumorphicButtonStyle(shape: .circle, color: .gray))
    }
    
    private var StepperGroupView: some View {
        VStack(alignment: .center, spacing: 8) {
            StepperView(title: "Seniors", value: seniors, minusButton: {
                StepperButton1(value: $seniors, increment: false)
            }, plusButton: {
                StepperButton1(value: $seniors, increment: true)
            })
            
            Seperator
            
            StepperView(title: "Adults", value: adults, minusButton: {
                StepperButton2(value: $adults, increment: false)
            }, plusButton: {
                StepperButton2(value: $adults, increment: true)
            })
            
            Seperator
            
            StepperView(title: "Kids", value: kids, minusButton: {
                StepperButton3(value: $kids, increment: false)
            }, plusButton: {
                StepperButton3(value: $kids, increment: true)
            })
            
            Seperator
            
            StepperView(title: "Babies", value: babies, minusButton: {
                StepperButton4(value: $babies, increment: false)
            }, plusButton: {
                StepperButton4(value: $babies, increment: true)
            })
        }
        .padding(8)
        .neumorphism(using: .rect(cornerRadius: 16), color: .gray, style: .out)
    }
    
}

// MARK: - PREVIEWS

#Preview {
    TabView {
        Glassmorphism()
        
        Claymorphism()
        
        Neumorphism()
    }
    .tabViewStyle(.page)
    .ignoresSafeArea()
}
