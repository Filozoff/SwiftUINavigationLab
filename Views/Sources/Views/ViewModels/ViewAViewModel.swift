import Combine
import SwiftUI
import ViewAdditions

public class ViewAViewModel: ObservableObject {

    public var onNext: Closure?

    let id = UUID()
    @Published var counter = 0
    @Published var isAutobump = false

    private var cancellables = Set<AnyCancellable>()

    public init(onNext: Closure? = nil) {
        self.onNext = onNext
        print("A: \(id) \(#function)")
    }

    deinit {
        print("A: \(id) \(#function)")
    }

    func onButtonTap() {
        onNext?()
    }

    func bump() {
        counter += 1
    }

    func startStop() {
        isAutobump.toggle()
        guard isAutobump else {
            cancellables.removeAll()
            return
        }

        startAutobump()
    }

    func startAutobump() {
        Timer.publish(every: 4, on: .main, in: .default)
            .autoconnect()
            .sink { [unowned self] _ in
                self.bump()
            }
            .store(in: &cancellables)
    }
}
