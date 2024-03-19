import Foundation

@available(*, deprecated, message: "Consider using GlobalDependency.container (Swinject) instead")
public typealias DependencyFactory = () -> Any

@available(*, deprecated, message: "Consider using GlobalDependency.container (Swinject) instead")
public protocol ContainerRegisterProtocol {
    func register<Dependency>(_ type: Dependency.Type, factory: @escaping () -> Dependency)
}

@available(*, deprecated, message: "Consider using ContainerResolverProtocol (Swinject) instead")
public protocol DependencyContainerProtocol: ContainerRegisterProtocol {
    func resolve<Dependency>(_ type: Dependency.Type) -> Dependency
}

@available(*, deprecated, message: "Consider using GlobalDependency.container (Swinject) instead")
public final class DependencyContainer: DependencyContainerProtocol {
    
    private var dependencies = [String: DependencyFactory]()
    
    // MARK: - Global Container
    
    public static let shared = DependencyContainer()
    
    // MARK: - Initializer
    
    public init() {}
    
    // MARK: - Container
    
    public func register<Dependency>(_ type: Dependency.Type, factory: @escaping () -> Dependency) {
        let name = String(describing: type)
        dependencies[name] = factory
    }
    
    public func resolve<Dependency>(_ type: Dependency.Type) -> Dependency {
        let name = String(describing: type)
        
        guard let factory = dependencies[name],
              let dependency = factory() as? Dependency else {
            preconditionFailure("Failed to resolve dependency: \(name)")
        }

        return dependency
    }
}
