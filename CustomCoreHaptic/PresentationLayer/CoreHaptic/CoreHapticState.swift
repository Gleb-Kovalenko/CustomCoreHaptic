//
//  CoreHapticState.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 06.02.2023.
//

import Foundation
import TCA

// MARK: - CoreHapticState

public struct CoreHapticState {
    
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
    
    // MARK: - Properties
    
    public var lineChartData = [Point]()
    @BindableState public var selectedHapticType: HapticType = .transient
    @BindableState public var intensitySettingValue: Double = 0.5
    @BindableState public var sharpnessSettingValue: Double = 0.5
    @BindableState public var timingSettingValue: Double = 0.1
}

// MARK: - Equatable

extension CoreHapticState: Equatable {
    
    public static func == (lhs: CoreHapticState, rhs: CoreHapticState) -> Bool {
        return lhs.selectedHapticType == rhs.selectedHapticType &&
               lhs.lineChartData == rhs.lineChartData &&
               lhs.intensitySettingValue == rhs.intensitySettingValue &&
               lhs.sharpnessSettingValue == rhs.sharpnessSettingValue &&
               lhs.timingSettingValue == rhs.timingSettingValue
    }
}
