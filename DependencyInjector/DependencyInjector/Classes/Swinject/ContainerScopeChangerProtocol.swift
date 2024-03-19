import Swinject

public protocol ContainerScopeChangerProtocol {
    func resetObjectScope(_ objectScope: ObjectScope)
}

extension Container: ContainerScopeChangerProtocol {}
