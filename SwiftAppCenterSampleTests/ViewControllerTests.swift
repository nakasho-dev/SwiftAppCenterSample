import XCTest
import Nimble
@testable import SwiftAppCenterSample

class ViewControllerTests: XCTestCase {
    var subject: ViewController!
    
    var fakeTranslateService: FakeTranslateService!
    
    override func setUp() {
        super.setUp()
        
        fakeTranslateService = FakeTranslateService()
        
        subject = ViewController(translateService: fakeTranslateService)
        _ = subject.view
    }
    
    func test_tapTranslateButton() {
        subject.inputText.text = "jp-text"
        let resultText = "en-text"
        
        subject.translateButton.sendActions(for: .touchUpInside)
        fakeTranslateService.translate_promise.success(resultText)

        expect(self.fakeTranslateService.translate_args).to(equal("jp-text"))
        expect(self.subject.translatedText.text).toEventually(equal(resultText))
    }
}
