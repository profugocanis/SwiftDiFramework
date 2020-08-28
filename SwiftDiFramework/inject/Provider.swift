import Foundation

public class Provider {

    fileprivate var singeltonComponents: [ObjectsPrototype] = []
    fileprivate var repositoryComponents: [ObjectsPrototype] = []
    fileprivate var repositorySingeltonComponents: [ObjectsPrototype] = []
    fileprivate var viewModelComponents: [ObjectsPrototype] = []
    fileprivate var initSingeltonComponents: [ObjectsPrototype] = []
    fileprivate var singeltonArr: [Any?] = []

    public init(components: [ObjectsPrototype]) {
        components.forEach {component in
            switch component.type {
            case .viewModel:
                viewModelComponents.append(component)
            case .repository:
                repositoryComponents.append(component)
            case .singelton:
                singeltonComponents.append(component)
            case .initSingelton:
                initSingeltonComponents.append(component)
            case .repositorySingelton:
                repositorySingeltonComponents.append(component)
            }
        }
    }
    
    public init(component: ObjectsPrototype) {
        switch component.type {
        case .viewModel:
            viewModelComponents.append(component)
        case .repository:
            repositoryComponents.append(component)
        case .singelton:
            singeltonComponents.append(component)
        case .initSingelton:
            initSingeltonComponents.append(component)
        case .repositorySingelton:
            repositorySingeltonComponents.append(component)
        }
    }

    // MARK: get
    func get<T>() -> T? {
        var res: T?

        singeltonComponents.forEach {component in
            res = self.getSingelton(component)
            if res != nil { return }
        }
        if res != nil { return res }

        repositoryComponents.forEach {component in
            res = self.getRepository(component)
            if res != nil {return}
        }
        if res != nil {return res}
        
        repositorySingeltonComponents.forEach {component in
            res = self.getRepositorySingelton(component)
            if res != nil {return}
        }
        if res != nil {return res}

        return res
    }
}

// MARK: getSingelton
public extension Provider {
    func getSingelton<T>(_ component: ObjectsPrototype) -> T? {
        var res: T?

        singeltonArr.forEach {it in
            if it is T {
                res = it as? T
            }
        }

        if res == nil {
            initSingeltonComponents.forEach {components in
                components.initSingelton.forEach {it in
                    if it is T {
                        res = it as? T
                    }
                }
            }
        }

        if res == nil {
            component.objArr.forEach {sourse in
                let t = type(of: sourse)
                let tString = String(describing: t)
                let typeString = String(describing: T.Type.self)
                if typeString.contains(tString.replacingOccurrences(of: ".Type", with: "")) {
                    res = sourse.init() as? T
                    singeltonArr.append(res)
                }
            }
        }
        return res
    }
}

// MARK: getRepositorySingelton
public extension Provider {
    func getRepositorySingelton<T>(_ component: ObjectsPrototype) -> T? {
        var res: T?

        singeltonArr.forEach {it in
            if it is T {
                res = it as? T
            }
        }

        if res == nil {
            component.repoSingeltonMap.forEach {repo in
                if String(describing: T.self).contains(repo.key) {
                    res = repo.value.init() as? T
                    singeltonArr.append(res)
                }
            }
        }
        return res
    }
}

// MARK: getRepository
public extension Provider {
    func getRepository<T>(_ component: ObjectsPrototype) -> T? {
        var res: T?
        component.repoMap.forEach {repo in
            if String(describing: T.self).contains(repo.key) {
                res = repo.value.init() as? T
            }
        }
        return res
    }
}

// MARK: getViewModel
public extension Provider {
    func getVM<T: ViewModelProtocol>(_ t: Any) -> T? {
        var res: T?
        self.viewModelComponents.filter {component in
            return component.type == .viewModel
        }.forEach { obj in
            obj.objArr.forEach { viewModel in
                if String(describing: t) == String(describing: viewModel.self) {
                    res = viewModel.init() as? T
                }
            }
        }
        return res
    }
}
