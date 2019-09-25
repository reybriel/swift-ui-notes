import SwiftUI

extension View {
    func relativeWidth(relation: CGFloat) -> some View {
        GeometryReader { proxy in
            self.frame(width: proxy.size.width * relation)
        }
    }
}
