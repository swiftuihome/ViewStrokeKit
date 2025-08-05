//
//  ViewStrokeView.swift
//  ViewStrokeKit
//
//  Created by devlink on 2025/8/5.
//

import SwiftUI

public struct ViewStrokeView: View {
    // 渐变色描边（图标）
    let iconStrokeGradient = LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing)
    
    // 渐变色描边（文字）
    let textStrokeGradient = LinearGradient(colors: [.cyan, .purple], startPoint: .leading, endPoint: .trailing)
    
    // 实心描边（文字）
    let textStrokeSolidColor = Color.white
    
    public init() {}
    
    public var body: some View {
        VStack {
            Image(systemName: "swift")
                .foregroundStyle(.white)
                .font(.system(size: 60))
                .viewStroke(iconStrokeGradient, width: 3)
            
            Text("SwiftUI")
                .foregroundStyle(.white)
                .font(.system(size: 60, weight: .bold))
                .viewStroke(textStrokeGradient, width: 2)
                .viewStroke(textStrokeSolidColor, width: 3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

#Preview {
    ViewStrokeView()
}

