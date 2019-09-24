import SwiftUI

// MARK: - Constants

private enum Constants {
    static let newTitleMessage: String = "Add a title for your note"
    static let fieldPlaceholder: String = "Shopping list"
    static let textFieldInsets: EdgeInsets = .init(top: 0, leading: 30, bottom: 0, trailing: 30)
}

// MARK: - Title View

struct NoteTitleView: View {
    
    // MARK: Properties

    @ObservedObject
    private var viewModel: NoteTitleViewModel = .init()
    
    private var textFieldStyle: some TextFieldStyle {
        RoundedBorderTextFieldStyle()
    }
    
    // MARK: Body
    
    var body: some View {
        VStack {
            Text(Constants.newTitleMessage)
                .padding()
            TextField(Constants.fieldPlaceholder, text: $viewModel.title)
                .textFieldStyle(textFieldStyle)
                .padding(Constants.textFieldInsets)
                .multilineTextAlignment(.center)
        }
        .frame(maxHeight: .infinity)
        .background(Color.major)
    }
}
