enum CreateNoteWithTitleUseCaseFactory {
    static func make(title: String, presenter: CreateNoteWithTitleUseCasePresenter & AnyObject,
                     gateway: CreateNoteWithTitleGateway) -> CanRun {
        CreateNoteWithTitleUseCase(title: title, presenter: presenter, gateway: gateway)
    }
}
