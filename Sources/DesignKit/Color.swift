//
//  Color.swift
//  FlowUp
//
//  Created by linhey on 4/13/25.
//

import SwiftUI

public extension Color {
    
    enum DLevel10: Int, CaseIterable {
        case d1 = 1, d2, d3, d4, d5, d6, d7, d8, d9, d10
    }
    
    enum DKind10: String, CaseIterable {
        case red, blue, brown, cyan, green, n, purple, orange
    }
    
    enum DGradient: Int, CaseIterable {
        case d2_1
        case d6_4
    }
    
    
    static func color(_ kind: DKind10, _ level: DLevel10) -> Color {
        let name = "\(kind.rawValue)\(level.rawValue)"
        return Color(name, bundle: .module)
    }
    
    static var red1: Color { color(.red, .d1) }
    static var red2: Color { color(.red, .d2) }
    static var red3: Color { color(.red, .d3) }
    static var red4: Color { color(.red, .d4) }
    static var red5: Color { color(.red, .d5) }
    static var red6: Color { color(.red, .d6) }
    static var red7: Color { color(.red, .d7) }
    static var red8: Color { color(.red, .d8) }
    static var red9: Color { color(.red, .d9) }
    static var red10: Color { color(.red, .d10) }
    
    static var blue1: Color { color(.blue, .d1) }
    static var blue2: Color { color(.blue, .d2) }
    static var blue3: Color { color(.blue, .d3) }
    static var blue4: Color { color(.blue, .d4) }
    static var blue5: Color { color(.blue, .d5) }
    static var blue6: Color { color(.blue, .d6) }
    static var blue7: Color { color(.blue, .d7) }
    static var blue8: Color { color(.blue, .d8) }
    static var blue9: Color { color(.blue, .d9) }
    static var blue10: Color { color(.blue, .d10) }
    
    static var brown1: Color { color(.brown, .d1) }
    static var brown2: Color { color(.brown, .d2) }
    static var brown3: Color { color(.brown, .d3) }
    static var brown4: Color { color(.brown, .d4) }
    static var brown5: Color { color(.brown, .d5) }
    static var brown6: Color { color(.brown, .d6) }
    static var brown7: Color { color(.brown, .d7) }
    static var brown8: Color { color(.brown, .d8) }
    static var brown9: Color { color(.brown, .d9) }
    static var brown10: Color { color(.brown, .d10) }
    
    static var cyan1: Color { color(.cyan, .d1) }
    static var cyan2: Color { color(.cyan, .d2) }
    static var cyan3: Color { color(.cyan, .d3) }
    static var cyan4: Color { color(.cyan, .d4) }
    static var cyan5: Color { color(.cyan, .d5) }
    static var cyan6: Color { color(.cyan, .d6) }
    static var cyan7: Color { color(.cyan, .d7) }
    static var cyan8: Color { color(.cyan, .d8) }
    static var cyan9: Color { color(.cyan, .d9) }
    static var cyan10: Color { color(.cyan, .d10) }
    
    static var green1: Color { color(.green, .d1) }
    static var green2: Color { color(.green, .d2) }
    static var green3: Color { color(.green, .d3) }
    static var green4: Color { color(.green, .d4) }
    static var green5: Color { color(.green, .d5) }
    static var green6: Color { color(.green, .d6) }
    static var green7: Color { color(.green, .d7) }
    static var green8: Color { color(.green, .d8) }
    static var green9: Color { color(.green, .d9) }
    static var green10: Color { color(.green, .d10) }
    
    static var n1: Color { color(.n, .d1) }
    static var n2: Color { color(.n, .d2) }
    static var n3: Color { color(.n, .d3) }
    static var n4: Color { color(.n, .d4) }
    static var n5: Color { color(.n, .d5) }
    static var n6: Color { color(.n, .d6) }
    static var n7: Color { color(.n, .d7) }
    static var n8: Color { color(.n, .d8) }
    static var n9: Color { color(.n, .d9) }
    static var n10: Color { color(.n, .d10) }
    
    static var purple1: Color { color(.purple, .d1) }
    static var purple2: Color { color(.purple, .d2) }
    static var purple3: Color { color(.purple, .d3) }
    static var purple4: Color { color(.purple, .d4) }
    static var purple5: Color { color(.purple, .d5) }
    static var purple6: Color { color(.purple, .d6) }
    static var purple7: Color { color(.purple, .d7) }
    static var purple8: Color { color(.purple, .d8) }
    static var purple9: Color { color(.purple, .d9) }
    static var purple10: Color { color(.purple, .d10) }
    
    static var orange1: Color { color(.orange, .d1) }
    static var orange2: Color { color(.orange, .d2) }
    static var orange3: Color { color(.orange, .d3) }
    static var orange4: Color { color(.orange, .d4) }
    static var orange5: Color { color(.orange, .d5) }
    static var orange6: Color { color(.orange, .d6) }
    static var orange7: Color { color(.orange, .d7) }
    static var orange8: Color { color(.orange, .d8) }
    static var orange9: Color { color(.orange, .d9) }
    static var orange10: Color { color(.orange, .d10) }
}

public extension [Color] {
    
    static var purple2_1: [Color] { [.purple2, .purple1] }
    static var purple6_4: [Color] { [.purple6, .purple4] }
    
    static var green2_1: [Color] { [.green2, .green1] }
    static var green6_4: [Color] { [.green6, .green4] }
    
    static var red2_1: [Color] { [.red2, .red1] }
    static var red6_4: [Color] { [.red6, .red4] }
    
    static var brown2_1: [Color] { [.brown2, .brown1] }
    static var brown6_4: [Color] { [.brown6, .brown4] }
    
    static var orange2_1: [Color] { [.orange2, .orange1] }
    static var orange6_4: [Color] { [.orange6, .orange4] }
    
    static var blue2_1: [Color] { [.blue2, .blue1] }
    static var blue6_4: [Color] { [.blue6, .blue4] }
    
}

#Preview {
    ScrollView {
        VStack(alignment: .leading, spacing: 20) {
            Text("颜色预览")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
            
            ForEach(Color.DKind10.allCases, id: \.self) { kind in
                VStack(alignment: .leading) {
                    Text(kind.rawValue.capitalized)
                        .font(.headline)
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 10) {
                        ForEach(Color.DLevel10.allCases, id: \.self) { level in
                            VStack {
                                Color.color(kind, level)
                                    .frame(height: 60)
                                    .cornerRadius(8)
                                
                                Text("\(kind.rawValue)\(level.rawValue)")
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 10)
            }
            
            Divider()
                .padding(.vertical)
            
            Text("渐变色预览")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
            
            VStack(spacing: 16) {
                Group {
                    gradientPreview(colors: .purple2_1, title: "purple2_1")
                    gradientPreview(colors: .purple6_4, title: "purple6_4")
                    
                    gradientPreview(colors: .green2_1, title: "green2_1")
                    gradientPreview(colors: .green6_4, title: "green6_4")
                    
                    gradientPreview(colors: .red2_1, title: "red2_1")
                    gradientPreview(colors: .red6_4, title: "red6_4")
                }
                
                Group {
                    gradientPreview(colors: .brown2_1, title: "brown2_1")
                    gradientPreview(colors: .brown6_4, title: "brown6_4")
                    
                    gradientPreview(colors: .orange2_1, title: "orange2_1")
                    gradientPreview(colors: .orange6_4, title: "orange6_4")
                    
                    gradientPreview(colors: .blue2_1, title: "blue2_1")
                    gradientPreview(colors: .blue6_4, title: "blue6_4")
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
    .background(Color(.systemBackground))
}

// 辅助函数用于创建渐变色预览
fileprivate func gradientPreview(colors: [Color], title: String) -> some View {
    VStack(alignment: .leading) {
        Text(title)
            .font(.headline)
        
        LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing)
            .frame(height: 80)
            .cornerRadius(12)
            .overlay(
                Text(title)
                    .foregroundColor(.white)
                    .shadow(radius: 1)
            )
    }
}
