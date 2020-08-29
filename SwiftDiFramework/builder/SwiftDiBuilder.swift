import Foundation

public class SwiftDiBuilder {
    public static let shared: SwiftDiBuilder = SwiftDiBuilder()
    
    var appComponent: AppComponent!
    var targetList: [TargetModuleProtocol.Type] = []
    
    private init() {}
    
    public func configure(_ appComponent: AppComponent) -> SwiftDiBuilder {
        self.appComponent = appComponent
        return self
    }
    
    public func addTarget(_ targetModule: TargetModuleProtocol.Type) -> SwiftDiBuilder {
        targetList.append(targetModule)
        return self
    }
    
    public func create() {
        SwiftDi.shared.appComponent = self.appComponent
        targetList.forEach {module in
            module.init().configure().appComponent = appComponent
        }
    }
}
