import Foundation

// MARK: Singelton
public func singelton(@BuilderSingelton _ block: () -> ObjectsPrototype) -> ObjectsPrototype {
    return block()
}

@_functionBuilder public struct BuilderSingelton {
    public static func buildBlock(_ atrs: InjectedType.Type...) -> ObjectsPrototype {
        let objs = ObjectsPrototype()
        objs.type = .singelton
        objs.objArr = atrs
        return objs
    }
}

// MARK: initSingelton
public func initSingelton(@BuilderInitSingelton _ block: () -> ObjectsPrototype) -> ObjectsPrototype {
    return block()
}

@_functionBuilder public struct BuilderInitSingelton {
    public static func buildBlock(_ atrs: Any...) -> ObjectsPrototype {
        let objs = ObjectsPrototype()
        objs.type = .initSingelton
        objs.initSingelton = atrs
        return objs
    }
}
