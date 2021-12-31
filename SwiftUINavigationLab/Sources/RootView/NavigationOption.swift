import Foundation

extension RootView {

	struct NavigationOption: Equatable, Identifiable {
		let name: String
		var id: String { name }
	}
}

extension RootView.NavigationOption {

	static func ~= (a: Self, b: Self) -> Bool { a == b }
}

extension RootView.NavigationOption {

	static let defaultSwiftUINavigation = Self(name: "Default SwiftUI navigation")
}
