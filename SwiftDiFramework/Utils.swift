import Foundation

func threadAsync(_ f: @escaping () -> Void) {
    DispatchQueue.global().async {
        f()
    }
}

func threadMain(_ f: @escaping () -> Void) {
    DispatchQueue.main.async {
        f()
    }
}

func postRun(_ sleep: TimeInterval = 0.6, _ f: @escaping () -> Void) {
    DispatchQueue.global().async {
        Thread.sleep(forTimeInterval: sleep)
        DispatchQueue.main.async {
            f()
        }
    }
}
