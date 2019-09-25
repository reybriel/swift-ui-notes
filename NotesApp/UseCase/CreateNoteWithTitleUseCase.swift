import Combine

typealias CreateNoteWithTitleUseCasePresenter = CanShowSuccess & CanShowAlertFeedback

struct CreateNoteWithTitleUseCase: CanRun {
    let title: String
    unowned let presenter: CreateNoteWithTitleUseCasePresenter & AnyObject

    func run() {
        if title.isEmpty {
            presenter.show(feedback: .attemptToCreateNoteWithoutTitle)
        } else {
            presenter.showSuccess()
        }
    }
}
