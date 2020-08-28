import Foundation

public func module(@BuilderModule _ block: () -> ObjectsPrototype) -> ObjectsPrototype {
    return block()
}

@_functionBuilder public struct BuilderModule {
    public static func buildBlock(_ atrs: createFunc...) -> ObjectsPrototype {
        let objs = ObjectsPrototype()
        objs.type = .fun
        
        atrs.forEach {it in
            objs.fun.append(it)
        }
        return objs
    }
}
