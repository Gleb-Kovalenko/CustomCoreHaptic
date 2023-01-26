//
//  HapticType.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 24.01.2023.
//

import Foundation

// MARK: - HapticType

public enum HapticType: String, CaseIterable {
    
    // MARK: - Cases
    
    case transient
    case continuous
    case dynamic
    
    // MARK: - Useful
    
    public var title: String {
        rawValue.capitalizingFirstLetter()
    }
}
