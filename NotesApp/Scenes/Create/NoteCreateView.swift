import SwiftUI

// MARK: - Constants

private enum Constants {
    static let textFieldInsets: EdgeInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
}

// MARK: - Title View

struct NoteCreateView: View {
    
    // MARK: Properties

    @ObservedObject
    var viewModel: NoteCreateViewModel
    let createNoteWithTitleGateway: CreateNoteWithTitleGateway
    
    // MARK: Body
    
    var body: some View {
        VStack {
            Text(Strings.NoteCreate.newTitleMessage)
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
        CreateNoteWithTitleUseCaseFactory.make(title: viewModel.title,
                                               presenter: viewModel,
                                               gateway: createNoteWithTitleGateway).run()
    }
}
