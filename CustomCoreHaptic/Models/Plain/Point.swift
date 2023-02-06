//
//  Point.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 06.02.2023.
//

import Foundation

// MARK: - Point

public struct Point {
    var x: Double
    var y: Double
}

// MARK: - Equatable

extension Point: Equatable {
    
    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
