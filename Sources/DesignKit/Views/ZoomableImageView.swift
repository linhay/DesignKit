//
// Copyright © 2025 Stream.io Inc. All rights reserved.
//

import Combine
import SwiftUI

public struct ZoomableScrollView<Content: View>: View {
    
    let content: Content

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State var scale: CGFloat = 1
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        ZoomableScrollViewIMP(scale: $scale, content: content)
            .onChange(of: horizontalSizeClass) { oldValue, newValue in
                scale = 1
            }
            .onChange(of: verticalSizeClass) { oldValue, newValue in
                scale = 1
            }
    }
    
}

struct ZoomableScrollViewIMP<Content: View>: UIViewRepresentable {

    @Binding var scale: CGFloat
    let content: Content

    init(scale: Binding<CGFloat>, content: Content) {
        self._scale = scale
        self.content = content
    }

    func makeUIView(context: Context) -> UIScrollView {
        // 设置 UIScrollView
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        scrollView.maximumZoomScale = 20
        scrollView.minimumZoomScale = 1
        scrollView.zoomScale = scale // 设置初始缩放
        scrollView.bouncesZoom = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        if let hostView = context.coordinator.hostingController.view {
            hostView.translatesAutoresizingMaskIntoConstraints = true
            hostView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            hostView.frame = scrollView.bounds
            hostView.backgroundColor = .clear
            scrollView.addSubview(hostView)
        }

        return scrollView
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func updateUIView(_ scrollView: UIScrollView, context: Context) {
        if scrollView.zoomScale != scale {
            scrollView.zoomScale = scale
            if scale == 1 {
                scrollView.contentSize = scrollView.frame.size
            }
        }
    }

    // MARK: - Coordinator

    class Coordinator: NSObject, UIScrollViewDelegate {
        let hostingController: UIHostingController<Content>
        let parent: ZoomableScrollViewIMP

        init(parent: ZoomableScrollViewIMP) {
            hostingController = UIHostingController(rootView: parent.content)
            self.parent = parent
        }

        func viewForZooming(in _: UIScrollView) -> UIView? {
            hostingController.view
        }

        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            parent.scale = scrollView.zoomScale
        }
    }
}
