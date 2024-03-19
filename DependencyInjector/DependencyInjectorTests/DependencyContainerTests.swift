import TestUtils
import XCTest
@testable import DependencyInjector

final class DependencyContainerTests: XCTestCase {
    
    private let sut = DependencyContainer.shared
    
    @Inject private var dummy: Dummy
        
    func test_register_shouldAppendFactory() throws {
        sut.register(Dummy.self) {
            Dummy()
        }
        
        let mirroredSut = Mirror(reflecting: sut)
        let dependencies = try XCTUnwrap(mirroredSut.firstChild(of: [String: DependencyFactory].self))
        XCTAssertEqual(dependencies.count, 1)
        XCTAssertTrue(dependencies[String(describing: Dummy.self)]?() is Dummy)
    }
    
    func test_resolve_givenHasRegisteredDependency() {
        XCTAssertNotNil(sut.resolve(Dummy.self))
    }
    
    func test_injectPropertyWrapper_givenHasRegisteredDependency() {
        XCTAssertNotNil(dummy)
    }
}
