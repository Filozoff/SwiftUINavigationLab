import Combine
import Foundation

public class ViewModelE: ObservableObject {

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
