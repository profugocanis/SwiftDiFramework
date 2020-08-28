import Foundation
import SwiftDiFramework
import RxSwift

final class A: InjectedType {
    init() {
        print("ijk init A")
    }
    @Inject var b: B!
}

final class B: InjectedType {
    init() {}
    
    init(name: String) {
        print("ijk init B - \(name)")
    }
    func foo() -> Observable<Int> {
        return Observable.timer(RxTimeInterval.seconds(1), period: RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
    }
}
