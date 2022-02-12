import SwiftUI
import ViewAdditions

public class ViewCViewModel: ObservableObject {

    public var onNext: Closure?

    let id = UUID()
    @Published var counter = 0

    public init(onNext: Closure? = nil) {
        self.onNext = onNext
        print("C: \(id) \(#function)")
    }

    deinit {
        print("C: \(id) \(#function)")
    }

    func onButtonTap() {
        onNext?()
    }

    func bump() {
        counter += 1
    }
}
