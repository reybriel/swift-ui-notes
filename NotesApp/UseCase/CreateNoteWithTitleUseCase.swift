import Foundation
import Combine

typealias CreateNoteWithTitleUseCasePresenter = CanShowSuccess & CanShowAlertFeedback

struct CreateNoteWithTitleUseCase: CanRun {
    let title: String
    unowned let presenter: CreateNoteWithTitleUseCasePresenter & AnyObject
    
    func run() {
        if title.isEmpty {
            presenter.show(feedback: .attemptToCreateNoteWithoutTitle)
        } else {
            createNoteUpstream()
        }
    }
    
    @discardableResult
    private func createNoteUpstream() -> AnyCancellable {
        Future(createNote)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { event in
                if case .failure(_) = event {
                    self.presenter.show(feedback: .unknownError)
                }
            }, receiveValue: {
                self.presenter.showSuccess()
            })
    }
    
    private func createNote(completion: @escaping (Result<Void, Error>) -> Void) {
        let _ = Timer.publish(every: 2.0, on: .main, in: .default)
            .autoconnect()
            .first()
            .map({ _ in () })
            .subscribe(on: DispatchQueue.global())
            .sink(receiveValue: {
                completion(.success(()))
            })
    }
}
