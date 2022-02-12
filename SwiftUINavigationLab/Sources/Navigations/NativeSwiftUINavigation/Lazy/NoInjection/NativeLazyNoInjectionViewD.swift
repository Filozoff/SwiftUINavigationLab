import SwiftUI
import ViewAdditions

extension NativeLazyNoInjection {
    
    public struct ViewD: View {

        @State private var isActive = false
        @StateObject private var viewModel = ViewModelD()

        public var body: some View {
            let _ = Self._printChanges()
            Text("Counter: \(viewModel.counter)")
            Button("Bump") {
                viewModel.bump()
            }

            NavigationLink("Go to view E", isActive: $isActive) {
                LazyView(NativeLazyNoInjection.ViewE())
            }
        }
    }
}
