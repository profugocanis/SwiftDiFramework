import Foundation

// MARK: repositorySingelton
public func repositoryesSingelton(@BuilderManyRepositorySingelton _ block: () -> ObjectsPrototype) -> ObjectsPrototype {
    return block()
}

@_functionBuilder public struct BuilderManyRepositorySingelton {
    public static func buildBlock(_ atrs: (String, InjectedType.Type)...) -> ObjectsPrototype {
        let objs = ObjectsPrototype()
        objs.type = .repositorySingelton

        var repoMap: [String: InjectedType.Type] = [:]

        atrs.forEach {it in
            repoMap[it.0] = it.1
        }

        objs.repoSingeltonMap = repoMap
        return objs
    }
}

// MARK: repositorySingelton
public func repositorySingelton(@BuilderOneRepositorySingelton _ block: () -> ObjectsPrototype) -> ObjectsPrototype {
    return block()
}

@_functionBuilder public struct BuilderOneRepositorySingelton {
    public static func buildBlock(_ atr: (String, InjectedType.Type)) -> ObjectsPrototype {
        let objs = ObjectsPrototype()
        objs.type = .repositorySingelton

        var repoMap: [String: InjectedType.Type] = [:]

        repoMap[atr.0] = atr.1

        objs.repoSingeltonMap = repoMap
        return objs
    }
}
