open class NotesUITestCase: NotesTestCase {

    open override func setUp() {
        super.setUp()
        App.ui.launch()
    }

    open override func tearDown() {
        super.tearDown()
        App.ui.terminate()
    }
}
