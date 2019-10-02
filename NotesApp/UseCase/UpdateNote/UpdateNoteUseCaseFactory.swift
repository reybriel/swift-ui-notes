enum UpdateNoteUseCaseFactory {
    static func make(note: NoteViewModel, presenter: UpdateNoteUseCasePresenter & AnyObject) -> CanRun {
        UpdateNoteUseCase(noteViewModel: note, gateway: NotesDAO.shared, presenter: presenter)
    }
}
