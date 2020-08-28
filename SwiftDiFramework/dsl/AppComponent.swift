import Foundation

public class AppComponent {
    
    public var provider: Provider?

    public init(@BuilderComponent _ block: () -> [ObjectsPrototype]) {
        self.provider = Provider(components: block())
    }
    
    public init(@BuilderComponent _ block: () -> ObjectsPrototype) {
        self.provider = Provider(component: block())
    }
}

@_functionBuilder public struct BuilderComponent {
    public static func buildBlock(_ atrs: ObjectsPrototype...) -> [ObjectsPrototype] {
        print("ijk \(atrs)")
        return atrs
    }
}
