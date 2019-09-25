import SwiftUI

// MARK: - Constants

private enum Constants {
    static let newTitleMessage: String = "Add a title for your note"
    static let textFieldInsets: EdgeInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
    static let emptyTitleMessage: String = ""
}

// MARK: - Title View

struct NoteCreateView: View {
    
    // MARK: Properties

    @ObservedObject
    var viewModel: NoteCreateViewModel
    
    // MARK: Body
    
    var body: some View {
        VStack {
            Text(Constants.newTitleMessage)
                .padding()
            TextField("", text: $viewModel.title, onCommit: onTextFieldCommit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(Constants.textFieldInsets)
                .multilineTextAlignment(.center)
        }
        .frame(maxHeight: .infinity)
        .background(Color.major)
        .alert(isPresented: $viewModel.shouldShowAlert) { () -> Alert in
            Alert(title: Text(viewModel.alertTitle),
                  message: Text(viewModel.alertMessage))
        }
    }

    private func onTextFieldCommit() {
        CreateNoteWithTitleUseCase(title: viewModel.title, presenter: viewModel).run()
    }
}
