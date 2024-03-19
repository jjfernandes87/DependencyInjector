@available(*, deprecated, message: "Consider using GlobalDependency.container (Swinject) instead")
@propertyWrapper
public struct Inject<Dependency> {

    private var dependency: Dependency
    
    public init(_ container: DependencyContainer = .shared) {
        dependency = container.resolve(Dependency.self)
    }
    
    public var wrappedValue: Dependency {
        get { return dependency }
        set { dependency = newValue }
    }
}
