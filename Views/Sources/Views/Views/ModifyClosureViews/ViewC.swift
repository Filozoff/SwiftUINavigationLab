import SwiftUI
import ViewAdditions

public extension ModifyClosuresViews {

    struct ViewC: View {

        @StateObject private var viewModel = ViewCViewModel()
        let onNext: Closure

        public init(onNext: @escaping Closure) {
            self.onNext = onNext
        }

        public var body: some View {
            let _ = Self._printChanges()

            VStack(spacing: 20.0) {
                Text("Counter: \(viewModel.counter)")
                Button("Bump") {
                    viewModel.bump()
                }

                Button("Go to view D") {
                    viewModel.onButtonTap()
                }
            }
            .onAppear {
                viewModel.onNext = onNext
            }
        }
    }
}
