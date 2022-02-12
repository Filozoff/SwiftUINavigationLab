import SwiftUI
import FlowStacks
import Views

struct ExampleFlowStackCoordinator: View {

    @State private var routes: Routes<Screen> = [.root(.viewOne, embedInNavigationView: true)]

    var body: some View {
        Router($routes) { screen, _ in
            switch screen {
            case .viewOne:
                ModifyClosuresViews.ViewA {
                    $0.onNext = {
                        push(screen: .viewTwo)
                    }
                }

            case .viewTwo:
                ModifyClosuresViews.ViewB {
                    $0.onNext = {
                        push(screen: .viewThree)
                    }
                }

            case .viewThree:
                ModifyClosuresViews.ViewC {
                    push(screen: .viewFour)
                }

            case .viewFour:
                ModifyClosuresViews.ViewD {
                    $0.onNext = { event in
                        switch event {
                        case .next:
                            push(screen: .viewFive)

                        case .pop:
                            pop()

                        case .popToRoot:
                            popToRoot()
                        }
                    }
                }

            case .viewFive:
                ModifyClosuresViews.ViewE { _ in }
            }
        }
    }

    func pop() {
        routes.pop()
    }

    func popToRoot() {
        routes.popToRoot()
    }

    func push(screen: Screen) {
        routes.push(screen)
    }
}

extension ExampleFlowStackCoordinator {

    enum Screen {
        case viewOne
        case viewTwo
        case viewThree
        case viewFour
        case viewFive
    }
}

struct ExampleFlowStackCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        ExampleFlowStackCoordinator()
    }
}
