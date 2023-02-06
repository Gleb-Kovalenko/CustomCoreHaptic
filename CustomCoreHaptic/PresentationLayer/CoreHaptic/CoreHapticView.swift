//
//  CoreHapticView.swift
//  CustomCoreHaptic
//
//  Created by Gleb Kovalenko on 24.01.2023.
//

import SwiftUI
import Foundation
import TCA

// MARK: - CoreHapticView

public struct CoreHapticView: View {
    
    // MARK: - Properties
    
    let store: StoreOf<CoreHapticFeature>
    
    //Для теста пока оставил, потом уберу
    @State private var testChartData = [
        Point(x: 0.3, y: 0.3),
        Point(x: 0.4, y: 0.5),
        Point(x: 0.5, y: 0.5),
        Point(x: 0.7, y: 1.0),
        Point(x: 1.1, y: 0.3),
        Point(x: 1.2, y: 0.1),
        Point(x: 1.4, y: 0.1),
    ]
    
    // MARK: - Private
    
    private func test() {
        print("some button clicked")
    }
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView(showsIndicators: false) {
                    HStack {
                        ScrollView(.horizontal) {
                            Spacer()
                            switch viewStore.state.selectedHapticType {
                            case .transient:
                                RectanglesRowView(selectedHapticType: viewStore.selectedHapticType)
                                    .overlay(
                                        Divider().background(.gray),
                                        alignment: .center
                                    )
                                Spacer()
                            case .continuous:
                                LineChartView(data: $testChartData)
                                    .padding(Constants.lineChartInsets)
                            case .dynamic:
                                RectanglesRowView(selectedHapticType: viewStore.selectedHapticType)
                            }
                        }
                        
                        VStack(alignment: .trailing) {
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
                            .padding()
                            Spacer()
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
                            .padding()
                        }
                        .frame(width: Constants.patternGroupWidth * 0.3)
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
                    
                    VStack {
                        Picker("Select haptic type", selection: viewStore.binding(\.$selectedHapticType)) {
                            ForEach(CoreHapticState.HapticType.allCases, id: \.self) {
                                Text($0.title)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding(Constants.pickerInsets)
                    
                    VStack {
                        HapticSettingView(
                            hapticSetting: .intensity,
                            selectedHapticType: viewStore.selectedHapticType,
                            settingValue: viewStore.binding(\.$intensitySettingValue)
                        )
                        Divider()
                            .background(.gray)
                            .padding()
                        HapticSettingView(
                            hapticSetting: .sharpness,
                            selectedHapticType: viewStore.selectedHapticType,
                            settingValue: viewStore.binding(\.$sharpnessSettingValue)
                        )
                        Divider()
                            .background(.gray)
                            .padding()
                        HapticSettingView(
                            hapticSetting: .timing,
                            selectedHapticType: viewStore.selectedHapticType,
                            settingValue: viewStore.binding(\.$timingSettingValue)
                        )
                    }
                }
                .navigationBarTitle(Text("Core Haptic"))
                .padding()
            }
        }
    }
}

// MARK: - Preview

struct CoreHapticView_Previews: PreviewProvider {
    static var previews: some View {
        CoreHapticView(store:
            Store(
                initialState: CoreHapticState(),
                reducer: CoreHapticFeature()
            )
        )
    }
}

// MARK: - HapticSettingView

private struct HapticSettingView: View {
    
    // MARK: - Properties
    
    let hapticSetting: HapticSetting
    let selectedHapticType: CoreHapticState.HapticType
    @Binding var settingValue: Double
    
    // MARK: - View
    
    var body: some View {
        VStack {
            HStack(spacing: Constants.hapticSettingInfoStackSpacing) {
                Image(systemName: hapticSetting.imageName)
                    .resizable()
                    .frame(
                        width: Constants.hapticSettingImageSettingWidth,
                        height: Constants.hapticSettingImageSettingHeight
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

// MARK: - RectanglesRowView

private struct RectanglesRowView: View {
    
    // MARK: - Properties
    
    let selectedHapticType: CoreHapticState.HapticType
    
    // MARK: - View
    
    var body: some View {
        HStack(spacing: selectedHapticType == .transient ? Constants.transientStackSpacing : 0) {
            ForEach(0..<10) { _ in
                Rectangle()
                    .frame(
                        width: Constants.rectangleWidth * Double.random(in: 0.5...1),
                        height: Constants.rectangleHeight * Double.random(in: 0.5...1),
                        alignment: .leading
                    )
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - LineChartView

private struct LineChartView: View {
    
    // MARK: - Properties
    
    @Binding var data: [Point]

    // MARK: - View
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<data.count) { index in
                Circle()
                    .fill(.gray)
                    .frame(width: Constants.lineChartCircleWidth, height: Constants.lineChartCircleHeight)
                    .offset(
                        x: data[index].x * geometry.size.width * 10 - 5,
                        y: geometry.size.height - (data[index].y * geometry.size.height) - 5
                    )
            }
            Path { path in
                print(geometry.size.height)
                for (index, point) in data.enumerated() {
                    let x = point.x * Double(geometry.size.width) * 10
                    let y = geometry.size.height - (point.y * Double(geometry.size.height))

                    if index == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(.gray, lineWidth: Constants.lineChartLineWidth)
        }
    }
}



// MARK: - Constants

private enum Constants {
    static let defaultSettingValue: Double = 0.5
    static let defaultTimingSettingValue: Double = 0.1
    static let labelFontSize: CGFloat = 24
    static let lineChartInsets: EdgeInsets = EdgeInsets(top: 50, leading: 8, bottom: 8, trailing: 50)
    static let patternGroupWidth: CGFloat = UIScreen.main.bounds.width * 0.9
    static let patternGroupHeight: CGFloat = UIScreen.main.bounds.height * 0.3
    static let leftBorderTopPadding: CGFloat = 16
    static let buttonsStackSpacing: CGFloat = 24
    static let buttonWidth: CGFloat = 20
    static let buttonHeight: CGFloat = 20
    static let pickerInsets: EdgeInsets = EdgeInsets(top: 12, leading: 0, bottom: 18, trailing: 0)
    static let hapticSettingInfoStackSpacing: CGFloat = 24
    static let hapticSettingImageSettingWidth: CGFloat = 20
    static let hapticSettingImageSettingHeight: CGFloat = 20
    static let hapticSettingLineWidth: CGFloat = 3
    static let rectangleWidth: CGFloat = 25
    static let rectangleHeight: CGFloat = 80
    static let transientStackSpacing: CGFloat = 12
    static let lineChartCircleWidth: CGFloat = 10
    static let lineChartCircleHeight: CGFloat = 10
    static let lineChartLineWidth: CGFloat = 3
}
