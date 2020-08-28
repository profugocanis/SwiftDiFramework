import Foundation

// MARK: repository
public func repository(@BuilderRepository _ block: () -> ObjectsPrototype) -> ObjectsPrototype {
    return block()
}

@_functionBuilder public struct BuilderRepository {
    public static func buildBlock(_ atrs: (String, InjectedType.Type)...) -> ObjectsPrototype {
        let objs = ObjectsPrototype()
        objs.type = .repository

        var repoMap: [String: InjectedType.Type] = [:]

        atrs.forEach {it in
            repoMap[it.0] = it.1
        }

        objs.repoMap = repoMap
        return objs
    }
}
