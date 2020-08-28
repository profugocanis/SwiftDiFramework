import Foundation
import RxSwift
import UIKit

public class MVVMViewController: UIViewController, LiveDataProtocol {
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
extension MVVMViewController {
    private func clear() {
        disposableLiveData()
        
        viewModelArr.forEach {it in
            it.cleared()
        }
        viewModelArr.removeAll()
    }
}
