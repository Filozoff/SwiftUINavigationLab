import SwiftUI
import ViewAdditions

extension NativeLazy {

    public struct ViewA: View {

        @State private var isActive = false

        public init() { }

        public var body: some View {
            let _ = Self._printChanges()
            NavigationView {
                VStack {
                    NavigationLink("Go to view B", isActive: $isActive) {
                        LazyView(NativeLazy.ViewB(viewModel: .init()))
                    }
                }
            }
        }
    }
}
