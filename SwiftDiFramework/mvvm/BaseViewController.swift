import Foundation
import RxSwift
import UIKit

public class BaseViewController: UIViewController, LiveDataProtocol {
    public var disposableArr: [Disposable] = []
    public var viewModelArr: [ViewModelProtocol] = []
    
    public func setLiveData(disposable: Disposable) {
        disposableArr.append(disposable)
    }
    
    public func disposableLiveData() {
        disposableArr.forEach {it in
            it.dispose()
        }
        disposableArr.removeAll()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        clear()
    }
    
    deinit {
        clear()
    }
}

// MARK: Disposable
extension BaseViewController {
    private func clear() {
        disposableLiveData()
        
        viewModelArr.forEach {it in
            it.cleared()
        }
        viewModelArr.removeAll()
    }
}
