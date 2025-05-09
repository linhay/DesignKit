import SwiftUI

public struct VisualContainer: View {
    
    @State var borderWidth: CGFloat = 1.4
    var radius: CGFloat
    var corners: UIRectCorner
    
    public init(radius: CGFloat, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }
    
    public var body: some View {
        ZStack {
            // 使用 Material 来实现模糊效果
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .fill(.ultraThinMaterial)
                .mask(alignment: .center) {
                    Rectangle()
                        .clipShape(RoundedCornerShape(radius: radius, corners: corners))
                }
            
            // 边框
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .stroke(Color.white.opacity(0.2), lineWidth: borderWidth)
                .mask(alignment: .center) {
                    Rectangle()
                        .clipShape(RoundedCornerShape(radius: radius, corners: corners))
                }
        }
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: .purple6_4, startPoint: .topTrailing, endPoint: .bottomLeading)
            .ignoresSafeArea()
        VStack {
            VisualContainer(radius: 10, corners: .allCorners)
                .frame(width: 200, height: 100)
            VisualContainer(radius: 20, corners: [.topLeft, .bottomRight])
                .frame(width: 200, height: 100)
        }
        .padding()
    }
}
