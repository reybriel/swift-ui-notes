enum GetAllNotesUseCaseFactory {
    static func make(presenter: GetAllNotesUseCasePresenter & AnyObject) -> CanRun {
        GetAllNotesUseCase(presenter: presenter, gateway: NotesDAO.shared)
    }
}
