//
//  CustomCoreHapticApp.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 24.01.2023.
//

import SwiftUI
import TCA

@main
struct CustomCoreHapticApp: App {
    var body: some Scene {
        WindowGroup {
            CoreHapticView(store:
                Store(
                    initialState: CoreHapticState(),
                    reducer: CoreHapticFeature()
                )
            )
        }
    }
}
