import UIKit
import SwiftDiFramework
import RxSwift

class ViewController: UIViewController {
    
    @Inject var a: A!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let f = view.frame
        let label = UILabel(frame: CGRect.init(x: f.width / 2 - 50, y: f.height / 2 - 50, width: 100, height: 100))
        label.textAlignment = .center
        view.addSubview(label)
        
        _ = a.b.foo()
            .subscribe {it in
                label.text = "\(it.element ?? 0)"
        }
    }
}
