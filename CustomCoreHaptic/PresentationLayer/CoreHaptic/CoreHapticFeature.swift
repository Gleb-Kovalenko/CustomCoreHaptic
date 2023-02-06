//
//  CoreHapticFeature.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 06.02.2023.
//

import SwiftUI
import Foundation
import TCA

// MARK: - CoreHapticFeature

public struct CoreHapticFeature: ReducerProtocol {
    
    public var body: some ReducerProtocol<CoreHapticState, CoreHapticAction> {
        BindingReducer()
        Reduce { (state, action) in
            switch action {
            default:
                break
            }
            return .none
        }
    }
}
