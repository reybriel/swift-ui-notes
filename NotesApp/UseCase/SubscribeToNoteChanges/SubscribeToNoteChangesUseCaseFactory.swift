enum SubscribeToNoteChangesUseCaseFactory {
    static func make(presenter: SubscribeToNoteChangesUseCasePresenter & AnyObject) -> CanRun {
        SubscribeToNoteChangesUseCase(presenter: presenter, gateway: NotesDAO.shared)
    }
}
