import SwiftUI

struct RootView: View {

	private let options: [NavigationOption] = [
		.defaultSwiftUINavigation
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
