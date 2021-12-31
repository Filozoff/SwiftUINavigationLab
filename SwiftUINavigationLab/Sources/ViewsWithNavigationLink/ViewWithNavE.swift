import SwiftUI
import ViewAdditions

public struct ViewWithNavE: View {

	@StateObject private var viewModel: ViewModel

	public init(viewModel: ViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
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

extension ViewWithNavE {

	public class ViewModel: ObservableObject {

		let text = "End"
		@Published var input = ""
		@Published var counter = 0

		public init() {
			print("E: \(#function)")
		}

		deinit {
			print("E: \(#function)")
		}

		func bump() {
			counter += 1
		}
	}
}
