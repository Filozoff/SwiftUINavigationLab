import Coordinator
import Coordinator2
import SwiftUI

struct RootView: View {

    private let options: [NavigationOption] = [
        .defaultSwiftUINavigation,
        .defaultSwiftUINavigationWithLazyViews,
        .defaultSwiftUINavigationWithLazyViewsAndNotInjectedViewModel,
        .coordinator1,
        .coordinator2,
        .flowStack
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

            case .coordinator1:
                Coordinator.ExampleCoordinator()

            case .coordinator2:
                Coordinator2.ExampleCoordinator()

            case .flowStack:
                ExampleFlowStackCoordinator()

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
