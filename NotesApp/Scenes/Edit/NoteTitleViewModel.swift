import Combine

final class NoteTitleViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var shouldShowAlert: Bool = false
    var alertMessage: String = ""
}
