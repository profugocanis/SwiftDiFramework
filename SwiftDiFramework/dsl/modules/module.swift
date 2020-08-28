import Foundation

// MARK: Singelton
public func module(@BuilderModule _ block: () -> ObjectsPrototype) -> ObjectsPrototype {
    return block()
}

@_functionBuilder public struct BuilderModule {
    public static func buildBlock(_ atrs: fun...) -> ObjectsPrototype {
        let objs = ObjectsPrototype()
        objs.type = .fun
        
        atrs.forEach {it in
            objs.fun.append(it)
        }
        return objs
    }
}

public final class fun {
    var type: Any?
    var f: (() -> Any)?
    public init(type: Any, _ f: @escaping () -> Any) {
        self.type = type
        self.f = f
    }
}
