## Installation

SwiftDiFramework Contains external dependency RxSwift.

These are currently the supported installation options:

### Manual

SwiftDi Framework

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

```ruby
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'SwiftDiFramework'
end
```

Replace `YOUR_TARGET_NAME` and then, in the `Podfile` directory, type:

```bash
$ pod install
```

## Use Singelton:

##### classes:
```swift
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
```
##### App Modules:
```swift
import SwiftDiFramework

let appDiModule = AppComponent {
    appSingeltons
}

let appSingeltons = singelton {
    A.self
    B.self
}
```

##### AppDelefgate:
```swift
import SwiftDiFramework

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ...
        SwiftDi.appComponent = appDiModule
        ...
        return true
    }
```

##### ViewController:
```swift
import SwiftDiFramework

    @Inject var a: A!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(a.b.foo())
    }
```
