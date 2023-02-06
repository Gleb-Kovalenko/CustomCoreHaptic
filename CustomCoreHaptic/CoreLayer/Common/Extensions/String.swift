//
//  String.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 24.01.2023.
//

import Foundation

// MARK: - String

extension String {
    
    public func capitalizingFirstLetter() -> String {
      prefix(1).uppercased() + lowercased().dropFirst()
    }
}
