import SwiftUI
import ViewAdditions

public class ViewDViewModel: ObservableObject {

    public var onNext: ValueClosure<Event>?

    let id = UUID()
    @Published var counter = 0

    public init(onNext: ValueClosure<Event>? = nil) {
        self.onNext = onNext
        print("D: \(id) \(#function)")
    }

    deinit {
        print("D: \(id) \(#function)")
    }

    func onNextTap() {
        onNext?(.next)
    }

    func onPopTap() {
        onNext?(.pop)
    }

    func onPopToRootTap() {
        onNext?(.popToRoot)
    }

    func bump() {
        counter += 1
    }
}

extension ViewDViewModel {

    public enum Event {
        case next
        case pop
        case popToRoot
    }
}
