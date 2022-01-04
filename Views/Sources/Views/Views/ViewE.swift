import SwiftUI

public struct ViewE: View {

	@StateObject private var viewModel: ViewEViewModel

	public init(viewModel: ViewEViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		let _ = Self._printChanges()
		
		VStack(spacing: 20.0) {
			Text("Counter: \(viewModel.counter)")
			Button("Bump") {
				viewModel.bump()
			}
			
			Text(viewModel.input)
			TextField("title", text: $viewModel.input)
		}
	}
}

struct ViewE_Previews: PreviewProvider {

	static var previews: some View {
		ViewE(viewModel: ViewEViewModel())
	}
}
