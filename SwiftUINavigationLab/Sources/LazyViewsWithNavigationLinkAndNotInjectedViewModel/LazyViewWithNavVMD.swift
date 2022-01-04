import SwiftUI
import ViewAdditions

public struct LazyViewWithNavVMD: View {

	@State private var isActive = false
	@StateObject private var viewModel = ViewModelD()

	public var body: some View {
		let _ = Self._printChanges()
		Text("Counter: \(viewModel.counter)")
		Button("Bump") {
			viewModel.bump()
		}

		NavigationLink("Go to view E", isActive: $isActive) {
			LazyView(LazyViewWithNavVME())
		}
	}
}

struct LazyViewWithNavVMD_Previews: PreviewProvider {
	static var previews: some View {
		LazyViewWithNavVMD()
	}
}
