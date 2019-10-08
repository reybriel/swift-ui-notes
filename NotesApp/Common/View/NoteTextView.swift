import SwiftUI
import Combine
import class UIKit.UITextView
import protocol UIKit.UITextViewDelegate
import class Foundation.NSObject

struct NoteTextView: UIViewRepresentable {
    var text: Binding<String>

    init(text: Binding<String>) {
        self.text = text
        textViewDelegate = TextViewDelegate(text: text)
        textView.delegate = textViewDelegate
    }

    private let textViewDelegate: TextViewDelegate
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16)
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        textView.autocapitalizationType = .sentences
        return textView
    }()

    func makeUIView(context: UIViewRepresentableContext<NoteTextView>) -> UITextView {
        textView
    }

    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<NoteTextView>) {
        textView.text = text.wrappedValue
    }
}

fileprivate class TextViewDelegate: NSObject, UITextViewDelegate {
    var text: Binding<String>

    init(text: Binding<String>) {
        self.text = text
    }

    func textViewDidChange(_ textView: UITextView) {
        text.wrappedValue = textView.text ?? ""
    }
}
