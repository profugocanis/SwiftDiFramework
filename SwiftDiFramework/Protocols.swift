import Foundation
import RxSwift

public protocol LiveDataDelegate: class {
    var viewModelArr: [ViewModelProtocol] { get set }
    func setLiveData(disposable: Disposable)
    func disposableLiveData()
}

public protocol ViewModelProtocol {
    func cleared()
}
