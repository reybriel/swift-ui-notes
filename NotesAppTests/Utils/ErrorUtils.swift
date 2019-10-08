struct TestError: Error {
    var localizedDescription: String {
        "Error thrown in test environment"
    }
}
