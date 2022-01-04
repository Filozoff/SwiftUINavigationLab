import SwiftUI
import ViewAdditions

public struct LazyViewWithNavVMB: View {

	@State private var isActive = false
	@StateObject private var viewModel = ViewModelB()

	public init() { }

	public var body: some View {
		let _ = Self._printChanges()
		Text("Counter: \(viewModel.counter)")
		Button("Bump") {
			viewModel.bump()
		}

		Button("Autobump \(viewModel.isAutobump ? "Stop" : "Start")") {
			viewModel.startStop()
		}

		NavigationLink("go to view C", isActive: $isActive) {
			LazyView(LazyViewWithNavVMC())
		}
	}
}

struct LazyViewWithNavVMB_Previews: PreviewProvider {
	static var previews: some View {
		LazyViewWithNavVMB()
	}
}
