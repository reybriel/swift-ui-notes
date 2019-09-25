import SwiftUI

struct NoteCreateView: View {
    static let textFieldRelation: CGFloat = 0.85

    @ObservedObject var viewModel: NoteCreateViewModel
    let createNoteWithTitleGateway: CreateNoteWithTitleGateway
    
    var body: some View {
        VStack {
            Text(Strings.NoteCreate.newTitleMessage)
                .padding()
            TextField("", text: $viewModel.title, onCommit: onTextFieldCommit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
        }
        .frame(maxHeight: .infinity)
        .relativeWidth(relation: NoteCreateView.textFieldRelation)
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
