import Foundation

public final class createFunc {
    var type: Any?
    var f: (() -> Any)?
    public init(type: Any, _ f: @escaping () -> Any) {
        self.type = type
        self.f = f
    }
}
