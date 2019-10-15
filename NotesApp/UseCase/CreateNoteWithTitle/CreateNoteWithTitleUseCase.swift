import Foundation
import Combine

typealias CreateNoteWithTitleUseCasePresenter = CanShowSuccess & CanShowAlertFeedback

struct CreateNoteWithTitleUseCase: CanRun {
    let title: String
    unowned let presenter: CreateNoteWithTitleUseCasePresenter & AnyObject
    unowned let gateway: CreateNoteWithTitleGateway

    func run() {
        if title.isEmpty {
            presenter.show(feedback: .attemptToCreateNoteWithoutTitle)
        } else {
            saveNote()
        }
    }

    private func saveNote() {
        let _ = gateway.createSaveUpstream(noteTitle: title)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { event in
                if case .failure(_) = event {
                    self.presenter.show(feedback: .unknownError)
                }
            }, receiveValue: {
                self.presenter.showSuccess()
            })
    }
}
