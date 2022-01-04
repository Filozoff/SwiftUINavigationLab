import SwiftUI
import ViewAdditions

public struct ViewWithNavD: View {

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
			ViewWithNavE(viewModel: .init())
		}
	}
}

struct ViewWithNavD_Previews: PreviewProvider {
	static var previews: some View {
		ViewWithNavD(viewModel: .init())
	}
}
