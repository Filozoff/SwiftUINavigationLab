import Foundation

public class ViewEViewModel: ObservableObject {

    let id = UUID()
    let text = "End"
    @Published var input = ""
    @Published var counter = 0

    public init() {
        print("E: \(id) \(#function)")
    }

    deinit {
        print("E: \(id) \(#function)")
    }

    func bump() {
        counter += 1
    }
}
