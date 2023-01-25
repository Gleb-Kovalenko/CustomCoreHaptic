//
//  HapticSettingView..swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 24.01.2023.
//

import SwiftUI
import Foundation

// MARK: - HapticSettingView

struct HapticSettingView: View {
    
    // MARK: - Properties
    
    var hapticSetting: HapticSetting
    var selectedHapticType: HapticType
    @Binding var settingValue: Double
    
    // MARK: - View
    
    var body: some View {
        VStack {
            HStack(spacing: Constants.infoStackSpacing) {
                Image(systemName: hapticSetting.imageName)
                    .resizable()
                    .frame(
                        width: Constants.imageSettingWidth,
                        height: Constants.imageSettingHeight
                    )
                    .foregroundColor(.accentColor)
                Text(hapticSetting.title(selectedHapticType: selectedHapticType))
                Spacer()
                Text("\(settingValue, specifier: "%.2f")")
            }
            switch hapticSetting {
            case .intensity, .sharpness:
                Slider(value: $settingValue, in: 0...1)
            case .timing:
                Slider(value: $settingValue, in: 0...0.2)
            }
        }
    }
}

// MARK: - HapticSettingView_Previews

struct HapticSettingView_Previews: PreviewProvider {
    static var previews: some View {
        HapticSettingView(
            hapticSetting: .timing,
            selectedHapticType: .dynamic,
            settingValue: .constant(0.1)
        )
    }
}

// MARK: - Constants

private enum Constants {
    static let infoStackSpacing: CGFloat = 24
    static let imageSettingWidth: CGFloat = 20
    static let imageSettingHeight: CGFloat = 20
    static let lineWidth: CGFloat = 3
}
