//
//  RectanglesRowView.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 25.01.2023.
//

import SwiftUI
import Foundation

// MARK: - RectanglesRowView

public struct RectanglesRowView: View {
    
    // MARK: - Properties
    
    @Binding var selectedHapticType: HapticType
    
    // MARK: - View
    
    public var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: selectedHapticType == .transient ? Constants.transientStackSpacing : 0) {
                ForEach(0..<5) { _ in
                    Rectangle()
                        .frame(
                            width: Constants.rectangleWidth * Double.random(in: 0.5...1),
                            height: Constants.rectangleHeight * Double.random(in: 0.5...1),
                            alignment: .leading
                        )
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

// MARK: - RectanglesRowView_Previews

struct RectanglesRowView_Previews: PreviewProvider {
    static var previews: some View {
        RectanglesRowView(
            selectedHapticType: .constant(.transient)
        )
    }
}

// MARK: - Constants

private enum Constants {
    static let rectangleWidth: CGFloat = 25
    static let rectangleHeight: CGFloat = 80
    static let transientStackSpacing: CGFloat = 12
}

