import SwiftUI

extension View {
    func createNote(_ isPresented: Binding<Bool>) -> some View {
        sheet(isPresented: isPresented) {
            NoteCreateViewFactory.make(isPresented: isPresented)
        }
    }
}
