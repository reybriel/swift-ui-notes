import SwiftUI

struct NoteEditView: View {
    @ObservedObject
    var viewModel: NoteEditViewModel
    
    var body: some View {
        NoteTextView(text: $viewModel.text)
            .frame(maxHeight: .infinity)
            .navigationBarTitle(title, displayMode: .inline)
            .navigationBarItems(trailing: saveButton.disabled(viewModel.isSaveButtonDisabled))
    }

    private var title: Text {
        Text(viewModel.title)
    }

    private var saveButton: Button<Text> {
        Button(action: viewModel.onSaveButtonTap, label: {
            Text("Save")
        })
    }
}
