import Combine
import SwiftUI
import ViewAdditions

public struct ViewWithNavC: View {

	@State private var isActive = false

	// Using `@StateObject` creates a copy of reference type passed through a `init` parameter.
	// That makes child view data safe from parent's updates.
	// On the other hand, updating a child's `viewModel` from parent won't trigger any changes on child.
	@StateObject private var viewModel: ViewModel

	public init(viewModel: ViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		Text("Counter: \(viewModel.counter)")
		Button("Bump") {
			viewModel.bump()
		}

		NavigationLink("Go to view D", isActive: $isActive) {
			ViewWithNavD(viewModel: .init())
		}
	}
}

struct ViewWithNavC_Previews: PreviewProvider {
	static var previews: some View {
		ViewWithNavC(viewModel: .init())
	}
}

extension ViewWithNavC {

	public class ViewModel: ObservableObject {

		let id = UUID()
		@Published var counter = 0
		@Published var isAutobump = false

		private var cancellables = Set<AnyCancellable>()

		public init() {
			print("C: \(id) \(#function)")
		}

		deinit {
			print("C: \(id) \(#function)")
		}

		func bump() {
			counter += 1
		}

		func startStop() {
			isAutobump.toggle()
			guard isAutobump else {
				cancellables.removeAll()
				return
			}

			startAutobump()
		}

		func startAutobump() {
			Timer.publish(every: 4, on: .main, in: .default)
				.autoconnect()
				.sink { [unowned self] output in
					self.bump()
				}
				.store(in: &cancellables)
		}
	}
}
