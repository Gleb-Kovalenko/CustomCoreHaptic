//
//  String.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 24.01.2023.
//

import Foundation

// MARK: - String

extension String {
    
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
