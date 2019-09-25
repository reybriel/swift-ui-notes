enum SubscribeToNoteChangesUseCaseFactory {
    static func make(presenter: SubscribeToNoteChangesUseCasePresenter & AnyObject) -> some CanRun {
        SubscribeToNoteChangesUseCase(presenter: presenter, gateway: NotesDAO.shared)
    }
}
