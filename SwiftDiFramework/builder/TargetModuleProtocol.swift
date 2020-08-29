import Foundation

public protocol TargetModuleProtocol: class {
    init()
    func configure() -> SwiftDi
}
