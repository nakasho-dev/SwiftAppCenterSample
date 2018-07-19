import XCTest
import Nimble
@testable import SwiftAppCenterSample

class TranslateServiceTests: XCTestCase {
    var subject: TranslateService!
    
    var fakeDefaultHttp: FakeDefaultHttp!
    var fakeTranslateResultParser: FakeTranslateResultParser!

    override func setUp() {
        super.setUp()
        
        fakeDefaultHttp = FakeDefaultHttp()
        fakeTranslateResultParser = FakeTranslateResultParser()
        
        subject = TranslateService(
            http: fakeDefaultHttp,
            parser: fakeTranslateResultParser
        )
    }
    
    func test_translate() {
        
    }
}
