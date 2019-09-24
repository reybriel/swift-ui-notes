import Combine

struct CreateNoteWithTitleUseCase {
    let viewModel: NoteTitleViewModel

    func run() {
        if viewModel.title.isEmpty {
            viewModel.alertMessage = "The title is empty!"
            viewModel.shouldShowAlert = true
        }
    }
}
