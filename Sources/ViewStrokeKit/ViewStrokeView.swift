//
//  ViewStrokeView.swift
//  ViewStrokeKit
//
//  Created by devlink on 2025/8/5.
//

import SwiftUI

public struct ViewStrokeView: View {
    public init() {}
    public var body: some View {
        VStack {
            Image(systemName: "swift")
                .foregroundStyle(.orange)
                .font(.system(size: 60))
                .viewStroke(color: .white, width: 3)
            
            Text("SwiftUI")
                .foregroundStyle(.white)
                .font(.system(size: 60, weight: .bold))
                .viewStroke(color: .cyan, width: 2)
                .viewStroke(color: .white, width: 3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}

#Preview {
    ViewStrokeView()
}

