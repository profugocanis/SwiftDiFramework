import Foundation
import SwiftDiFramework
import RxSwift

let appDiModule = AppComponent {
    appSingeltons
    appModules
    rep
}

let appSingeltons = singelton {
    C.self
    D.self
}

let rep = repositorySingelton {
    ("UserRepository", UserRepositoryImpl.self)
    ("UserRepository", UserRepositoryImpl.self)
}

let appModules = module {
    createFunc(type: A.self) {
        return A()
    }
    
    createFunc(type: B.self) {
        return B(name: "Foo")
    }
    
    createFunc(type: Observable<Int>.self) {
        return Observable<Int>.timer(RxTimeInterval.seconds(1), period: RxTimeInterval.milliseconds(100), scheduler: MainScheduler.instance)
    }
    
//    createFunc(type: UserRepository.self) {
//        return UserRepositoryImpl()
//    }
}
