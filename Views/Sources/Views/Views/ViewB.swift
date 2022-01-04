import SwiftUI
import ViewAdditions

public struct ViewB: View {

	@StateObject private var viewModel = ViewBViewModel()
	private let modify: ValueClosure<ViewBViewModel>
	private var isLoaded = false

	public init(modify: @escaping ValueClosure<ViewBViewModel>) {
		self.modify = modify
	}

	public var body: some View {
		let _ = Self._printChanges()

		VStack(spacing: 20.0) {
			Text("Counter: \(viewModel.counter)")
			Button("Bump") {
				viewModel.bump()
			}

			Button("Autobump \(viewModel.isAutobump ? "Stop" : "Start")") {
				viewModel.startStop()
			}

			Button("Go to view C") {
				viewModel.onButtonTap()
			}
		}
		.onAppear {
			modify(viewModel)
		}
	}
}

struct ViewB_Previews: PreviewProvider {
	static var previews: some View {
		ViewB(modify: { _ in })
	}
}
