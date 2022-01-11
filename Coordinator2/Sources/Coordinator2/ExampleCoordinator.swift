import SwiftUI
import ViewAdditions
import Views

public struct ExampleCoordinator: View {

    @State private var stack: [Node<Screen>] = [.push(.viewOne)]

    public var body: some View {
        NavigationView {
            NStack($stack) { screen, _ in
                switch screen {
                case .viewOne:
                    ViewA {
                        $0.onNext = {
                            push(screen: .viewTwo)
                        }
                    }

                case .viewTwo:
                    ViewB {
                        $0.onNext = {
                            push(screen: .viewThree)
                        }
                    }

                case .viewThree:
                    ViewC {
                        push(screen: .viewFour)
                    }

                case .viewFour:
                    ViewD {
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
                    ViewE { _ in }
                }
            }
        }
    }

    public init() { }

    func pop() {
        stack = stack.dropLast()
    }

    func popToRoot() {
        stack = Array(stack.prefix(1))
    }

    func push(screen: Screen) {
        stack.append(.push(screen))
    }

    func present(screen: Screen) {
        stack.append(.present(screen))
    }
}

extension ExampleCoordinator {

    enum Screen {
        case viewOne
        case viewTwo
        case viewThree
        case viewFour
        case viewFive
    }
}
