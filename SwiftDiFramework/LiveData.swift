import Foundation
import RxSwift

final public class LiveData<T> {
    
    public init() {}

    private let subject = PublishSubject<T>()
    public var lastObj: T?

    public func onNext(_ element: T) {
        lastObj = element
        subject.onNext(element)
    }
    
    public func observe<D: LiveDataDelegate>(_ sel: D?, isLifeCircle: Bool = true, isLast: Bool = true, _ callback : @escaping (D?, T) -> Void) {
        if isLast {
            if lastObj != nil {
                callback(sel, lastObj!)
            }
        }
        let disposable = subject
            .subscribe(onNext: { [weak sel] res in
                DispatchQueue.main.async { callback(sel, res) }
                }, onError: { error in print(error) }, onCompleted: { }, onDisposed: { })
        if isLifeCircle {
            sel?.setLiveData(disposable: disposable)
        }
    }
    
    public func observe(callback : @escaping (T) -> Void) -> Disposable {
        if lastObj != nil {
            callback(lastObj!)
        }
        let disposable = subject
            .subscribe(onNext: { res in
                DispatchQueue.main.async { callback(res) }
            }, onError: { error in print(error) }, onCompleted: { }, onDisposed: { })
        return disposable
    }
}
