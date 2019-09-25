import Foundation
import Combine

typealias SubscribeToNoteChangesUseCasePresenter = CanShowSuccess

struct SubscribeToNoteChangesUseCase: CanRun {
    unowned let presenter: SubscribeToNoteChangesUseCasePresenter & AnyObject
    unowned let gateway: SubscribeToNoteChangesGateway

    func run() {
        let _ = gateway.createNoteChangesUpstream()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                self.presenter.showSuccess()
            })
    }
}
