import Combine
import SwiftUI
import ViewAdditions

extension Native {

    public struct ViewC: View {

        @State private var isActive = false

        // Using `@StateObject` creates a copy of reference type passed through a `init` parameter.
        // That makes child view data safe from parent's updates.
        // On the other hand, updating a child's `viewModel` from parent won't trigger any changes on child.
        @StateObject private var viewModel: ViewModelC

        public init(viewModel: ViewModelC) {
            _viewModel = StateObject(wrappedValue: viewModel)
        }

        public var body: some View {
            let _ = Self._printChanges()
            Text("Counter: \(viewModel.counter)")
            Button("Bump") {
                viewModel.bump()
            }

            NavigationLink("Go to view D", isActive: $isActive) {
                Native.ViewD(viewModel: .init())
            }
        }
    }
}
