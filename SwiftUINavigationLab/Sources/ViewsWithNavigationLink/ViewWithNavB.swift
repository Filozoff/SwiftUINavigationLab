import Combine
import SwiftUI
import ViewAdditions

public struct ViewWithNavB: View {

	@State private var isActive = false
	@StateObject private var viewModel: ViewModel

	public init(viewModel: ViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		if #available(iOS 15.0, *) {
			let _ = Self._printChanges()
		}

		Text("Counter: \(viewModel.counter)")
		Button("Bump") {
			viewModel.bump()
		}

		Button("Autobump \(viewModel.isAutobump ? "Stop" : "Start")") {
			viewModel.startStop()
		}

		NavigationLink("go to view C", isActive: $isActive) {
			ViewWithNavC(viewModel: .init())
		}
	}
}

struct ViewWithNavB_Previews: PreviewProvider {
	static var previews: some View {
		ViewWithNavB(viewModel: .init())
	}
}

extension ViewWithNavB {

	public class ViewModel: ObservableObject {

		let id = UUID()
		@Published var counter = 0
		@Published var isAutobump = false

		private var cancellables = Set<AnyCancellable>()

		public init() {
			print("B: \(id) \(#function)")
		}

		deinit {
			print("B: \(id) \(#function)")
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
