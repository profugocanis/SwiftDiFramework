import Foundation

public class AppComponent { 

    public init(@BuilderComponent _ block: () -> [ObjectsPrototype]) {
        self.provide = Provider(components: block())
    }
    
    public init() {
        
    }

    public var provide: Provider?
}

@_functionBuilder public struct BuilderComponent {
    public static func buildBlock(_ atrs: ObjectsPrototype...) -> [ObjectsPrototype] {
        return atrs
    }
}
