import SwiftUI
import ViewAdditions

extension Native {

    public struct ViewB: View {

        @State private var isActive = false
        @StateObject private var viewModel: ViewModelB

        public init(viewModel: ViewModelB) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        public var body: some View {
            let _ = Self._printChanges()
            Text("Counter: \(viewModel.counter)")
            Button("Bump") {
                viewModel.bump()
            }

            Button("Autobump \(viewModel.isAutobump ? "Stop" : "Start")") {
                viewModel.startStop()
            }

            NavigationLink("go to view C", isActive: $isActive) {
                Native.ViewC(viewModel: .init())
            }
        }
    }
}
