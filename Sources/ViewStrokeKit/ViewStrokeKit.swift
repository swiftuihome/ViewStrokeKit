// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public extension View {
    func viewStroke(color: Color, width: CGFloat) -> some View {
        modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
}

public struct StrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat
    var strokeColor: Color
    
    public init(strokeSize: CGFloat = 1, strokeColor: Color = .blue) {
        self.strokeSize = strokeSize
        self.strokeColor = strokeColor
    }
    
    public func body(content: Content) -> some View {
        content
            .padding(strokeSize * 2)
            .background(
                Rectangle()
                    .foregroundStyle(strokeColor)
                    .mask({
                        outline(context: content)
                    })
            )
    }
    
    func outline(context: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id) {
                    layer.draw(text, at: .init(x: size.width/2, y: size.height/2))
                }
            }
        } symbols: {
            context.tag(id)
                .blur(radius: strokeSize)
        }
    }
}
