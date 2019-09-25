import SwiftUI

struct NoteCreateView: View {
    static let textFieldRelation: CGFloat = 0.85

    @ObservedObject var viewModel: NoteCreateViewModel
    
    var body: some View {
        VStack {
            Text(Strings.NoteCreate.newTitleMessage)
                .padding()
            TextField("", text: $viewModel.title, onCommit: viewModel.onTextFieldCommit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
        }
        .frame(maxHeight: .infinity)
        .relativeWidth(relation: NoteCreateView.textFieldRelation)
        .background(Color.major)
        .alert(isPresented: $viewModel.isShowingAlert) {
            Alert(title: Text(viewModel.alertTitle),
                  message: Text(viewModel.alertMessage))
        }
    }
}
