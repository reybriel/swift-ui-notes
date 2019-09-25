enum CreateNoteWithTitleUseCaseFactory {
    static func make(title: String, presenter: CreateNoteWithTitleUseCasePresenter & AnyObject,
                     gateway: CreateNoteWithTitleGateway)
        -> some CanRun {
        CreateNoteWithTitleUseCase(title: title, presenter: presenter, gateway: gateway)
    }
}
