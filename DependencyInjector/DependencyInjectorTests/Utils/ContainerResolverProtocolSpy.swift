import DependencyInjector

public typealias ContainerResolverProtocolDummy = ContainerResolverProtocolSpy

public final class ContainerResolverProtocolSpy: ContainerResolverProtocol {
    public enum Methods: Equatable {
        case resolveDependency(type: Any.Type)
        case resolveDependencyName(type: Any.Type, name: String?)
        case resolve(type: Any.Type)
        case resolveName(type: Any.Type, name: String?)
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.typeName == rhs.typeName
        }
        
        private var typeName: String {
            switch self {
            case let .resolveDependency(type),
                 let .resolveDependencyName(type, _),
                 let .resolve(type),
                 let .resolveName(type, _):
                return .init(describing: type)
            }
        }
    }
    
    public private(set) var calledMethods = [Methods]()
    private func called(_ method: Methods) {
        calledMethods.append(method)
    }
    
    public init() {}
    
    // MARK: - Protocol Methods
    public private(set) var resolveDependencyCalled = false
    public var resolveDependencyToBeReturned: Any?
    public func resolveDependency<Service>(_ serviceType: Service.Type) -> Service {
        resolveDependencyCalled = true
        called(.resolveDependency(type: serviceType))
        guard let dependency = resolveDependencyToBeReturned as? Service else {
            preconditionFailure("Unable to resolve dependency: \(serviceType)")
        }
        return dependency
    }
    
    public private(set) var resolveDependencyNameCalled = false
    public var resolveDependencyNameToBeReturned: Any?
    public func resolveDependency<Service>(_ serviceType: Service.Type, name: String?) -> Service {
        resolveDependencyNameCalled = true
        called(.resolveDependencyName(type: serviceType, name: name))
        guard let dependency = resolveDependencyNameToBeReturned as? Service else {
            preconditionFailure("Unable to resolve dependency: \(serviceType) with name: \(name)")
        }
        return dependency
    }
    
    public private(set) var resolveCalled = false
    public var resolveToBeReturned: Any?
    public func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        resolveCalled = true
        called(.resolve(type: serviceType))
        return resolveToBeReturned as? Service
    }
    
    public private(set) var resolveNameCalled = false
    public var resolveNameToBeReturned: Any?
    public func resolve<Service>(_ serviceType: Service.Type, name: String?) -> Service? {
        resolveNameCalled = true
        called(.resolveName(type: serviceType, name: name))
        return resolveNameToBeReturned as? Service
    }
}
