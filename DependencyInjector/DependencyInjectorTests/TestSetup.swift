import Foundation
@testable import DependencyInjector

final class TestSetup: NSObject {
    override init() {
        DependencyContainer.shared.register(Dummy.self) {
            Dummy()
        }
    }
}
