import Foundation
import Combine

typealias GetAllNotesUseCasePresenter = CanListNotes & CanShowEmptyState & CanShowAlertFeedback

struct GetAllNotesUseCase: CanRun {
    unowned let presenter: GetAllNotesUseCasePresenter & AnyObject
    unowned let gateway: GetAllNotesGateway

    func run() {
        let _ = gateway.createRequestUpstream()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { event in
                if case .failure(_) = event {
                    self.presenter.show(feedback: .unknownError)
                }
            }, receiveValue: { notes in
                if notes.isEmpty {
                    self.presenter.showEmptyState()
                } else {
                    self.presenter.list(notes: notes)
                }
            })
    }
}
