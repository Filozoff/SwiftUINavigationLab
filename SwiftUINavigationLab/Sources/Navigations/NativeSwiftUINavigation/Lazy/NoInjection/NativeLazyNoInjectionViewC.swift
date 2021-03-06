import SwiftUI
import ViewAdditions

extension NativeLazyNoInjection {

    public struct ViewC: View {

        @State private var isActive = false
        @StateObject private var viewModel = ViewModelC()

        public var body: some View {
            let _ = Self._printChanges()
            Text("Counter: \(viewModel.counter)")
            Button("Bump") {
                viewModel.bump()
            }

            NavigationLink("Go to view D", isActive: $isActive) {
                LazyView(NativeLazyNoInjection.ViewD())
            }
        }
    }
}
