import SwiftUI
import ViewAdditions

public struct ViewWithNavE: View {

	@StateObject private var viewModel: ViewModelE

	public init(viewModel: ViewModelE) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		let _ = Self._printChanges()
		VStack {
			Text("Counter: \(viewModel.counter)")
			Button("Bump") {
				viewModel.bump()
			}
			Text(viewModel.input)
			TextField("title", text: $viewModel.input)
		}
	}
}

struct ViewWithNavE_Previews: PreviewProvider {
	static var previews: some View {
		ViewWithNavE(viewModel: .init())
	}
}
