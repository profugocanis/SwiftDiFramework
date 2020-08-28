import UIKit
import SwiftDiFramework

class ViewController: UIViewController {
    
    @Inject var a: A!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(a.b.foo())
    }
}
