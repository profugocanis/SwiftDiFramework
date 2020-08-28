import Foundation

public class ObjectsPrototype {
    var type: ObjectType = .singelton
    var objArr: [InjectedType.Type] = []
    var repoMap: [String: InjectedType.Type] = [:]
    var repoSingeltonMap: [String: InjectedType.Type] = [:]
    var initSingelton: [Any] = []
    var fun: [fun] = []
}

enum ObjectType {
    case viewModel
    case repository
    case singelton
    case initSingelton
    case repositorySingelton
    case fun
}
