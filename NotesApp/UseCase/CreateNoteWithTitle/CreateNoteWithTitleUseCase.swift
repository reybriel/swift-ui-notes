import Foundation
import Combine

typealias CreateNoteWithTitleUseCasePresenter = CanShowSuccess & CanShowAlertFeedback

struct CreateNoteWithTitleUseCase: CanRun {
    let title: String
    unowned let presenter: CreateNoteWithTitleUseCasePresenter & AnyObject
    let gateway: CreateNoteWithTitleGateway
    
    func run() {
        if title.isEmpty {
            presenter.show(feedback: .attemptToCreateNoteWithoutTitle)
        } else {
            createNoteSaveUpstream()
        }
    }
    
    @discardableResult
    private func createNoteSaveUpstream() -> AnyCancellable {
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
        let _ = gateway.createSaveUpstream(noteTitle: title)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { event in
                if case let .failure(error) = event {
                    completion(.failure(error))
                }
            }, receiveValue: {
                completion(.success(()))
            })
    }
}
