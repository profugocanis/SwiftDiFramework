import Foundation
import SwiftDiFramework
import RxSwift

class A {
    init() {
        print("ijk init A")
    }
    @Inject var b: B
}

class B {
    init(name: String) {
        print("ijk init B - \(name)")
    }
    
    @Inject var obs: Observable<Int>
    
    func foo() -> Observable<Int> {
        return obs
    }
}

final class C: InjectedType {
    init() {}
}

final class D: InjectedType {
    init() {}
}


protocol UserRepository {
    var name: String { get }
}

class UserRepositoryImpl: UserRepository {
    var name: String = "ijk"
}
