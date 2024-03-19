import DependencyInjector

public final class ContainerRegisterProtocolSpy: ContainerRegisterProtocol {
    public init() {}
    
    public private(set) var registerCalled = false
    public private(set) var registerCalledCount = 0
    public private(set) var registerTypePassed: Any.Type?
    public private(set) var registerTypesPassed: [Any.Type] = []
    public private(set) var registerFactoryPassed: DependencyFactory?
    public private(set) var registerFactoriesPassed: [DependencyFactory] = []
    public func register<Dependency>(_ type: Dependency.Type, factory: @escaping () -> Dependency) {
        registerCalled = true
        registerCalledCount += 1
        registerTypePassed = type
        registerTypesPassed.append(type)
        registerFactoryPassed = factory
        registerFactoriesPassed.append(factory)
    }
}
