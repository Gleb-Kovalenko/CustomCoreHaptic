//
//  CoreHapticAction.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 06.02.2023.
//

import Foundation
import TCA

// MARK: - CoreHapticAction

public enum CoreHapticAction: BindableAction, Equatable {
    
    case binding(BindingAction<CoreHapticState>)
}
