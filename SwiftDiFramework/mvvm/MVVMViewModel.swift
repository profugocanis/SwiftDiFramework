import Foundation
import RxSwift

class Schedulers {
    let io = SerialDispatchQueueScheduler(qos: .background)
    let main = MainScheduler.instance
    
    private static var value: Schedulers?
    
    static var share: Schedulers {
        get {
            if value == nil {
                value = Schedulers()
            }
            return value!
        }
        set { _ = newValue }
    }
}

open class MVVMViewModel: ViewModelProtocol {
    let bag = DisposeBag()
    var disposableArr: [Disposable] = []
    let io = SerialDispatchQueueScheduler(qos: .background)
    let main = MainScheduler.instance
    let errorLiveData = LiveData<String>()
    private var alert: UIAlertController?
    
    open func cleared() {
        disposableArr.forEach { (disposable) in
            disposable.dispose()
        }
        disposableArr.removeAll()
    }
    
    open func errorConsumer(_ err: Error) {
        threadMain { [weak self] in
            self?.errorLiveData.onNext(err.localizedDescription)
        }
    }
}
