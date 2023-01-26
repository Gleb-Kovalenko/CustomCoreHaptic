//
//  ContentView.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 24.01.2023.
//

import SwiftUI
import Foundation

public struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var selectedHapticType: HapticType = .transient
    @State private var lineChartData = [(x: Double, y: Double)]()
    @State private var intensitySettingValue: Double = 0.5
    @State private var sharpnessSettingValue: Double = 0.5
    @State private var timingSettingValue: Double = 0.1
    
    //Для теста пока оставил, потом уберу
    @State private var testChartData = [(x: 0.0, y: 0.0), (x: 0.1, y: 0.1), (x: 0.13, y: 0.2), (x: 1.0, y: 1.0)]
    
    func test() {
        print("some button clicked")
    }
    
    // MARK: - View
    
    public var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Spacer()
                    switch selectedHapticType {
                    case .transient:
                        VStack(alignment: .leading) {
                            RectanglesRowView(selectedHapticType: $selectedHapticType)
                            .overlay(
                                Divider().background(.gray),
                                alignment: .center
                            )
                        }
                        Spacer()
                        
                    case .continuous:
                        VStack(alignment: .leading) {
                            LineChartView(data: $testChartData)
                                .padding(Constants.lineChartInsets)
                        }
                    case .dynamic:
                        VStack(alignment: .leading) {
                            RectanglesRowView(selectedHapticType: $selectedHapticType)
                        }
                    }
                }
                .frame(
                    width: Constants.patternGroupWidth,
                    height: Constants.patternGroupHeight
                )
                .overlay(
                    Divider().background(.gray),
                    alignment: .top
                )
                .overlay(
                    Divider().background(.gray),
                    alignment: .bottom
                )
                .overlay(
                    Rectangle()
                        .frame(width: 1, height: nil, alignment: .leading)
                        .foregroundColor(.gray)
                        .padding(.top, Constants.leftBorderTopPadding),
                    alignment: .leading
                )
                .overlay(
                    HStack(spacing: Constants.buttonsStackSpacing) {
                        Spacer()
                        Button(action: test) {
                            Image(systemName: "minus")
                                .resizable()
                                .frame(width: Constants.buttonWidth, height: 1)
                        }
                        Button(action: test) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                        }
                    }
                    .padding(),
                    alignment: .topTrailing
                )
                .overlay(
                    HStack(spacing: Constants.buttonsStackSpacing) {
                        Spacer()
                        Button(action: test) {
                            Image(systemName: "arrow.counterclockwise")
                                .resizable()
                                .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                        }
                        Button(action: test) {
                            Image(systemName: "play")
                                .resizable()
                                .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
                        }
                    }
                    .padding(),
                    alignment: .bottomTrailing
                )
                
                VStack {
                    Picker("Select haptic type", selection: $selectedHapticType) {
                        ForEach(HapticType.allCases, id: \.self) {
                            Text($0.title)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(Constants.pickerInsets)
                
                VStack(alignment: .leading) {
                    HapticSettingView(
                        hapticSetting: .intensity,
                        selectedHapticType: selectedHapticType,
                        settingValue: $intensitySettingValue
                    )
                    Divider()
                        .background(.gray)
                        .padding()
                    HapticSettingView(
                        hapticSetting: .sharpness,
                        selectedHapticType: selectedHapticType,
                        settingValue: $sharpnessSettingValue
                    )
                    Divider()
                        .background(.gray)
                        .padding()
                    HapticSettingView(
                        hapticSetting: .timing,
                        selectedHapticType: selectedHapticType,
                        settingValue: $timingSettingValue
                    )
                }
            }
            .padding()
            .navigationBarTitle(Text("Core Haptic"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Constants

private enum Constants {
    static let defaultSettingValue: Double = 0.5
    static let defaultTimingSettingValue: Double = 0.1
    static let labelFontSize: CGFloat = 24
    static let lineChartInsets: EdgeInsets = EdgeInsets(top: 50, leading: 8, bottom: 8, trailing: 50)
    static let patternGroupWidth: CGFloat = UIScreen.main.bounds.width * 0.9
    static let patternGroupHeight: CGFloat = UIScreen.main.bounds.height * 0.4
    static let leftBorderTopPadding: CGFloat = 16
    static let buttonsStackSpacing: CGFloat = 24
    static let buttonWidth: CGFloat = 20
    static let buttonHeight: CGFloat = 20
    static let pickerInsets: EdgeInsets = EdgeInsets(top: 12, leading: 0, bottom: 18, trailing: 0)
}
