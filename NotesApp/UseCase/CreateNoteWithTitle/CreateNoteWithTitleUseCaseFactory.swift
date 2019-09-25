enum CreateNoteWithTitleUseCaseFactory {
    static func make(title: String, presenter: CreateNoteWithTitleUseCasePresenter & AnyObject)
        -> CreateNoteWithTitleUseCase {
        CreateNoteWithTitleUseCase(title: title, presenter: presenter)
    }
}
