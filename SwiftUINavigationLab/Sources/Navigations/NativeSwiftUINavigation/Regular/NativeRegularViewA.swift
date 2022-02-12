import SwiftUI
import ViewAdditions

extension Native {

    public struct ViewA: View {

        @State private var isActive = false

        public init() { }

        public var body: some View {
            let _ = Self._printChanges()
            NavigationView {
                VStack {
                    NavigationLink("Go to view B", isActive: $isActive) {
                        Native.ViewB(viewModel: .init())
                    }
                }
            }
        }
    }
}
