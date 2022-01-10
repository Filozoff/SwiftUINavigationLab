import SwiftUI
import ViewAdditions

public struct ViewD: View {

    @StateObject private var viewModel = ViewDViewModel()
    private let modify: ValueClosure<ViewDViewModel>

    public init(modify: @escaping ValueClosure<ViewDViewModel>) {
        self.modify = modify
    }

    public var body: some View {
        let _ = Self._printChanges()

        VStack(spacing: 20.0) {
            Text("Counter: \(viewModel.counter)")
            Button("Bump") {
                viewModel.bump()
            }

            Button("Pop") {
                viewModel.onPopTap()
            }

            Button("Pop to root") {
                viewModel.onPopToRootTap()
            }

            Button("Go to view E") {
                viewModel.onNextTap()
            }
        }
        .onAppear {
            modify(viewModel)
        }
    }
}

struct ViewD_Previews: PreviewProvider {
    static var previews: some View {
        ViewD(modify: { _ in })
    }
}
