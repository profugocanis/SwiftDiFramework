import Foundation
import RxSwift

public protocol LiveDataProtocol: class {
    var viewModelArr: [ViewModelProtocol] { get set }
    var disposableArr: [Disposable] { get set }
    func setLiveData(disposable: Disposable)
    func disposableLiveData()
}
