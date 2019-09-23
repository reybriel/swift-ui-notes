import SwiftUI

struct CleanList<ElementView, Element>: View where ElementView: View, Element: Identifiable {

    let items: [Element]
    let forEach: (Element) -> ElementView

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(items) { item in
                    self.forEach(item)
                }
            }
            .padding(.leading)
            .padding(.trailing)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}
