import Foundation
import SwiftDiFramework

let appDiModule = AppComponent {
//    appSingeltons
    appModules
}

let appSingeltons = singelton {
    A.self
    B.self
}

let appModules = module {
    fun(type: A.self) {
        return A()
    }
    
    fun(type: B.self) {
        return B(name: "Foo")
    }
}
