import Foundation

// MARK: viewModels
public func viewModels(@BuilderViewModel _ block: () -> ObjectsPrototype) -> ObjectsPrototype {
    return block()
}

@_functionBuilder public struct BuilderViewModel {
    public static func buildBlock(_ atrs: InjectedType.Type...) -> ObjectsPrototype {
        let objs = ObjectsPrototype()
        objs.type = .viewModel
        objs.objArr = atrs
        return objs
    }
}
