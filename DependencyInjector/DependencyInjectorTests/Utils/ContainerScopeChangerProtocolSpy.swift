import Swinject
import DependencyInjector

public final class ContainerScopeChangerProtocolSpy: ContainerScopeChangerProtocol {
    
    public enum Method: Equatable {
        case resetObjectScope
    }
    
    public private(set) var calledMethods: [Method] = []
    
    public init() {}

    public private(set) var objectScopePassed: ObjectScope?
    public func resetObjectScope(_ objectScope: ObjectScope) {
        calledMethods.append(.resetObjectScope)
        objectScopePassed = objectScope
    }
    
    public func clearSpy() {
        calledMethods = []
        objectScopePassed = nil
    }
}
