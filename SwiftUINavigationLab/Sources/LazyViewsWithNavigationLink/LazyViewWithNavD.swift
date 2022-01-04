import SwiftUI
import ViewAdditions

public struct LazyViewWithNavD: View {

	@State private var isActive = false
	@StateObject private var viewModel: ViewModelD

	public init(viewModel: ViewModelD) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		let _ = Self._printChanges()
		Text("Counter: \(viewModel.counter)")
		Button("Bump") {
			viewModel.bump()
		}

		NavigationLink("Go to view E", isActive: $isActive) {
			LazyView(LazyViewWithNavE(viewModel: .init()))
		}
	}
}

struct LazyViewWithNavD_Previews: PreviewProvider {
	static var previews: some View {
		ViewWithNavD(viewModel: .init())
	}
}
