enum CreateNoteWithTitleUseCaseFactory {
    static func make(title: String, presenter: CreateNoteWithTitleUseCasePresenter & AnyObject,
                     gateway: CreateNoteWithTitleGateway)
        -> CreateNoteWithTitleUseCase {
        CreateNoteWithTitleUseCase(title: title, presenter: presenter, gateway: gateway)
    }
}
