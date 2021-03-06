import SwiftUI
import ViewAdditions

public extension ModifyClosuresViews {

    struct ViewE: View {

        @StateObject private var viewModel = ViewEViewModel()
        private let modify: ValueClosure<ViewEViewModel>

        public init(modify: @escaping ValueClosure<ViewEViewModel>) {
            self.modify = modify
        }

        public var body: some View {
            let _ = Self._printChanges()

            VStack(spacing: 20.0) {
                Text("Counter: \(viewModel.counter)")
                Button("Bump") {
                    viewModel.bump()
                }

                Text(viewModel.input)
                TextField("title", text: $viewModel.input)
            }
            .onAppear {
                modify(viewModel)
            }
        }
    }
}
