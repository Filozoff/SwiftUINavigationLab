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
	static let defaultSwiftUINavigationWithLazyViews = Self(name: "Default SwiftUI navigation with Lazy Views")
	static let defaultSwiftUINavigationWithLazyViewsAndNotInjectedViewModel = Self(name: "Default SwiftUI navigation with Lazy Views and not injected ViewModel")
}
