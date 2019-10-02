import SwiftUI

extension View {
    func expanded() -> some View {
        GeometryReader { _ in self }
    }
}
