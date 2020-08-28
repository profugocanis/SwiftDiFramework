import Foundation
import SwiftDiFramework

let appDiModule = AppComponent {
    appSingeltons
}

let appSingeltons = singelton {
    A.self
    B.self
}
