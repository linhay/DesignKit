//
//  CircularTypography.swift
//  DesignKit
//
//  Created by linhey on 4/18/25.
//
/// https://www.youtube.com/watch?v=SRsX4Zyf7U8&t=112s
import SwiftUI

struct CircularTypography: View {
    // MARK: - Variables
    @Binding var symbols: [String]
    @Binding var time: Double
    let fontSize: CGFloat = 28
    // MARK: - Views
    var body: some View {
        ZStack {
            ForEach(1..<symbols.count + 1, id: \.self) { index in
                GeometryReader { geometry in
                    let isOddIndex = index % 2 == 1
                    CircleTextView(needsRotation: isOddIndex,
                                   rotationDegree: time * Double(index),
                                   text: symbols[index - 1],
                                   textGap: CGFloat(fontSize * CGFloat(index)))
                    .foregroundStyle(isOddIndex ? Color(UIColor.label) : .gray)
                }
                // We'll change the opacity for each of the tracks
                .opacity((CGFloat(symbols.count) - CGFloat (index - 1)) * 0.225)
            }
            
        }
        
    }
    
}


#Preview {
    @Previewable @State var time: Double = 0
    CircularTypography(symbols: .constant(["ABCSADSADABCSADSADABCSADSAD",
                                           "SDSADSADSDSADSADSDSADSAD",
                                           "企业动态早知道"]),
                       time: $time)
    .rotation3DEffect(.degrees(time * 100), axis: (0, 0, 1))
    .animation(.smooth, value: time)
    .onAppear {
        Task {
            let speed = 0.2
            while true {
                try await Task.sleep(for: .seconds(speed))
                time += speed
            }
        }
    }
}
