import Combine
import Foundation

typealias UpdateNoteUseCasePresenter = CanShowNoteViewModel & CanShowAlertFeedback

struct UpdateNoteUseCase: CanRun {
    let noteViewModel: NoteViewModel
    unowned let gateway: UpdateNoteGateway
    unowned let presenter: UpdateNoteUseCasePresenter & AnyObject

    func run() {
        let _ = gateway.createUpdateSream(note: noteViewModel)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { event in
                if case .failure(_) = event {
                    self.presenter.show(feedback: .unknownError)
                }
            }, receiveValue: { note in
                self.presenter.show(note: note)
            })
    }
}
