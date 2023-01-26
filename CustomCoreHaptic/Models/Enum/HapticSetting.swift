//
//  HapticSetting.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 24.01.2023.
//

import Foundation
import SwiftUI

// MARK: - HapticSetting

public enum HapticSetting: String, CaseIterable {
    
    // MARK: - Cases
    
    case intensity
    case sharpness
    case timing
    
    // MARK: - Useful
   
    public func title(selectedHapticType: HapticType) -> String {
        switch selectedHapticType {
        case .dynamic:
            switch self {
            case .intensity, .sharpness:
                return rawValue.capitalizingFirstLetter()
            case .timing:
                return "Duration"
            }
        default:
            return rawValue.capitalizingFirstLetter()
        }
    }
    
    public var order: Int {
        switch self {
        case .intensity:
            return 0
        case .sharpness:
            return 1
        case .timing:
            return 2
        }
    }
    
    public var imageName: String {
        switch self {
        case .intensity:
            return "bolt"
        case .sharpness:
            return "circle.dashed"
        case .timing:
            return "timer"
        }
    }
}
