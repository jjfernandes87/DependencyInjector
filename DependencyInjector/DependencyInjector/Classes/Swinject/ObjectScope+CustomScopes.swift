import Swinject

public extension ObjectScope {
    static let sessionScope = ObjectScope(storageFactory: PermanentStorage.init)
}
