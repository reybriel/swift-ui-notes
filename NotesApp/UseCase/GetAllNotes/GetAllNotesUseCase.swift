import Foundation
import Combine

typealias GetAllNotesUseCasePresenter = CanListNotes & CanShowAlertFeedback

struct GetAllNotesUseCase: CanRun {

    let gateway: GetAllNotesGateway
    unowned let presenter: GetAllNotesUseCasePresenter & AnyObject

    func run() {
        let _ = gateway.createRequestUpstream()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { event in
                if case .failure(_) = event {
                    self.presenter.show(feedback: .unknownError)
                }
            }, receiveValue: { notes in
                self.presenter.list(notes: notes)
            })
    }
}
