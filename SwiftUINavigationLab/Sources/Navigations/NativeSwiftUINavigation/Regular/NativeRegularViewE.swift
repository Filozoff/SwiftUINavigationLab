import SwiftUI
import ViewAdditions

extension Native {

    public struct ViewE: View {

        @StateObject private var viewModel: ViewModelE

        public init(viewModel: ViewModelE) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        public var body: some View {
            let _ = Self._printChanges()
            VStack {
                Text("Counter: \(viewModel.counter)")
                Button("Bump") {
                    viewModel.bump()
                }
                Text(viewModel.input)
                TextField("title", text: $viewModel.input)
            }
        }
    }
}
