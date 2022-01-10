import SwiftUI
import ViewAdditions

public struct ViewA: View {

    @StateObject private var viewModel = ViewAViewModel()
    private let modify: ValueClosure<ViewAViewModel>

    public init(modify: @escaping ValueClosure<ViewAViewModel>) {
        self.modify = modify
    }

    public var body: some View {
        let _ = Self._printChanges()

        NavigationView {
            VStack {
                Button("Go to view B") {
                    viewModel.onButtonTap()
                }
            }
        }
        .navigationViewStyle(.stack)
        .onAppear {
            modify(viewModel)
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA(modify: { _ in })
    }
}
