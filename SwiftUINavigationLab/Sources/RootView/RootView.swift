import SwiftUI

struct RootView: View {

	private let options: [NavigationOption] = [
		.defaultSwiftUINavigation,
		.defaultSwiftUINavigationWithLazyViews,
		.defaultSwiftUINavigationWithLazyViewsAndNotInjectedViewModel
	]

	@State private var activeOption: NavigationOption?

    var body: some View {
		List(options) { option in
			Button(option.name) {
				activeOption = option
			}
		}
		.sheet(item: $activeOption) { option in
			switch option {
			case .defaultSwiftUINavigation:
				ViewWithNavA()

			case .defaultSwiftUINavigationWithLazyViews:
				LazyViewWithNavA()

			case .defaultSwiftUINavigationWithLazyViewsAndNotInjectedViewModel:
				LazyViewWithNavVMA()

			default:
				EmptyView()
			}
		}
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
		RootView()
    }
}
