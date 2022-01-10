import SwiftUI
import ViewAdditions

public struct LazyViewWithNavC: View {

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
            LazyView(LazyViewWithNavD(viewModel: .init()))
        }
    }
}

struct LazyViewWithNavC_Previews: PreviewProvider {
    static var previews: some View {
        LazyViewWithNavC(viewModel: .init())
    }
}
