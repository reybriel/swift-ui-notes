enum GetAllNotesUseCaseFactory {
    static func make(presenter: GetAllNotesUseCasePresenter & AnyObject) -> some CanRun {
        GetAllNotesUseCase(gateway: NotesDAO(), presenter: presenter)
    }
}
