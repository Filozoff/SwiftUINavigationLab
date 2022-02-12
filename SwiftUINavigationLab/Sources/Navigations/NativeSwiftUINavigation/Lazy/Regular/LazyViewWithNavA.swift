import SwiftUI
import ViewAdditions

public struct LazyViewWithNavA: View {

    @State private var isActive = false

    public init() { }

    public var body: some View {
        let _ = Self._printChanges()
        NavigationView {
            VStack {
                NavigationLink("Go to view B", isActive: $isActive) {
                    LazyView(LazyViewWithNavB(viewModel: .init()))
                }
            }
        }
    }
}

struct LazyViewWithNavA_Previews: PreviewProvider {
    static var previews: some View {
        LazyViewWithNavA()
    }
}
