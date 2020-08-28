import Foundation
import SwiftDiFramework

final class A: InjectedType {
    init() {}
    @Inject var b: B!
}

final class B: InjectedType {
    init() {}
    func foo() -> String {
        return "class B"
    }
}
