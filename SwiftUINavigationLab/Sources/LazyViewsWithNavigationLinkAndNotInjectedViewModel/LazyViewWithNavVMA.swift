import SwiftUI
import ViewAdditions

public struct LazyViewWithNavVMA: View {

	@State private var isActive = false

	public init() { }

	public var body: some View {
		let _ = Self._printChanges()
		NavigationView {
			VStack {
				NavigationLink("Go to view B", isActive: $isActive) {
					LazyView(LazyViewWithNavVMB())
				}
			}
		}
    }
}

struct LazyViewWithNavVMA_Previews: PreviewProvider {
    static var previews: some View {
		LazyViewWithNavVMA()
    }
}
