import SwiftUI

struct NoteCreateView: View {
    @ObservedObject var viewModel: NoteCreateViewModel
    
    var body: some View {
        VStack(alignment: .trailing) {
            closeButton
            VStack {
                Text(Strings.NoteCreate.newTitleMessage)
                    .font(.headline)
                    .padding()
                TextField("", text: self.$viewModel.title, onCommit: self.viewModel.onTextFieldCommit)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
            }
            .expanded()
        }
        .padding()
        .alert(isPresented: $viewModel.isShowingAlert) {
            Alert(title: Text(viewModel.alertTitle),
                  message: Text(viewModel.alertMessage))
        }
    }

    private var closeButton: Button<Image> {
        Button<Image>(action: viewModel.onCloseButtonTap, label: {
            Image(systemName: "xmark")
        })
    }
}
