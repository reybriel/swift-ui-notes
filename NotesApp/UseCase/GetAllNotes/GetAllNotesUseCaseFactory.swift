enum GetAllNotesUseCaseFactory {
    static func make(presenter: GetAllNotesUseCasePresenter & AnyObject) -> some CanRun {
        GetAllNotesUseCase(presenter: presenter, gateway: NotesDAO.shared)
    }
}
