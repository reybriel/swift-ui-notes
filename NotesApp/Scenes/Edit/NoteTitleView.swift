import SwiftUI

// MARK: - Constants

private enum Constants {
    static let newTitleMessage: String = "Add a title for your note"
    static let textFieldInsets: EdgeInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
    static let emptyTitleMessage: String = ""
}

// MARK: - Title View

struct NoteTitleView: View {
    
    // MARK: Properties

    @ObservedObject
    var viewModel: NoteTitleViewModel = .init()
    
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
            Alert(title: Text(viewModel.alertMessage))
        }
    }

    private func onTextFieldCommit() {
        CreateNoteWithTitleUseCase(viewModel: viewModel).run()
    }
}
