//
//  LineChartView..swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 25.01.2023.
//

import Foundation
import SwiftUI

// MARK: - LineChartView

struct LineChartView: View {
    
    // MARK: - Properties
    
    @Binding var data: [(x: Double, y: Double)]

    // MARK: - View
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<data.count) { index in
                Circle()
                    .fill(.gray)
                    .frame(width: Constants.circleWidth, height: Constants.circleHeight)
                    .offset(
                        x: data[index].x * geometry.size.width - 5,
                        y: geometry.size.height - (data[index].y * geometry.size.height) - 5
                    )
            }
            Path { path in
                for (index, point) in data.enumerated() {
                    let x = point.x * Double(geometry.size.width)
                    let y = geometry.size.height - (point.y * Double(geometry.size.height))

                    if index == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(.gray, lineWidth: Constants.lineWidth)
        }
    }
}

// MARK: - LineChartView_Previews

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        let data = [(x: 0.1, y: 0.0), (x: 0.1, y: 0.1), (x: 0.2, y: 0.7), (x: 0.2, y: 0.5)]
        LineChartView(data: .constant(data))
    }
}

// MARK: - Constants

private enum Constants {
    static let circleWidth: CGFloat = 10
    static let circleHeight: CGFloat = 10
    static let lineWidth: CGFloat = 3
}

