import Foundation
import UIKit

@propertyWrapper
public class Inject<T> {
    public let wrappedValue: T

    public init() {
        let res: T? = SwiftDi.appComponent.provide?.get()
        if res == nil {
            fatalError("\(T.self) nil state")
        }
        self.wrappedValue = res!
    }
}

@propertyWrapper
public class InjectViewModel<T: ViewModelProtocol> {

    public lazy var wrappedValue: T? = nil

    public init() {
        self.wrappedValue = SwiftDi.appComponent.provide?.getVM(T.self)!

        DispatchQueue.main.async {
            let vc = UIApplication
                .shared
                .keyWindow?
                .rootViewController?
                .children
                .last
            
            if vc == nil {
                fatalError("View conttroler nil state")
            }

            if vc is UITabBarController {
                let tab = vc as? UITabBarController
                tab?.viewControllers?.forEach {viewController in
                    (viewController as? LiveDataDelegate)?
                        .viewModelArr
                        .append(self.wrappedValue!)
                }
                return
            }

            if self.wrappedValue == nil {
                fatalError("\(T.self) nil state")
            }

            (vc as? LiveDataDelegate)?.viewModelArr.append(self.wrappedValue!)
        }
    }
}
