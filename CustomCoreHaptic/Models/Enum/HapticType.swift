//
//  HapticType.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 24.01.2023.
//

import Foundation

// MARK: - HapticType

enum HapticType: String, CaseIterable {
    
    // MARK: - Cases
    
    case transient
    case continuous
    case dynamic
    
    // MARK: - Useful
    
    var title: String {
        self.rawValue.capitalizingFirstLetter()
    }
}
