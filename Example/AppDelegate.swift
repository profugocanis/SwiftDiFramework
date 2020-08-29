import UIKit
import SwiftDiFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        SwiftDiBuilder.shared
            .configure(appDiModule)
            .create()
        
        return true
    }
}
