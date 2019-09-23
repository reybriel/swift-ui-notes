import SwiftUI

struct BarButton<BarButtonLabel>: View where BarButtonLabel: View {

    let action: () -> Void
    let label: BarButtonLabel

    var body: some View {
        Button(action: action, label: { self.label })
            .foregroundColor(.green)
    }
}
