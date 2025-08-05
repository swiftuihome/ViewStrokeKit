// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public extension View {
    func viewStroke<S: ShapeStyle>(_ style: S, width: CGFloat) -> some View {
        modifier(StrokeModifier(strokeStyle: style, strokeSize: width))
    }
}

public struct StrokeModifier<S: ShapeStyle>: ViewModifier {
    private let id = UUID()
    var strokeStyle: S
    var strokeSize: CGFloat
    
    public init(strokeStyle: S, strokeSize: CGFloat = 1) {
        self.strokeStyle = strokeStyle
        self.strokeSize = strokeSize
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(strokeSize * 2)
            .background(
                Rectangle()
                    .foregroundStyle(strokeStyle)
                    .mask {
                        outline(context: content)
                    }
            )
    }
    
    func outline(context: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id) {
                    layer.draw(text, at: .init(x: size.width / 2, y: size.height / 2))
                }
            }
        } symbols: {
            context.tag(id)
                .blur(radius: strokeSize)
        }
    }
}
