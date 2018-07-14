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
    
    func test_tapTranslateButton_putTransratedText_whenTranltateServiceWasSuccess() {
        subject.inputText.text = "jp-text"
        let resultText = "en-text"
        
        subject.translateButton.sendActions(for: .touchUpInside)
        fakeTranslateService.translate_promise.success(resultText)

        expect(self.fakeTranslateService.translate_args).to(equal("jp-text"))
        expect(self.subject.translatedText.text).toEventually(equal(resultText))
        
    }
    
    func test_tapTranslateButton_putNetworkFailedText_whenTranltateServiceWasNetworkFailure() {
        subject.inputText.text = "jp-text"
        
        subject.translateButton.sendActions(for: .touchUpInside)
        fakeTranslateService.translate_promise
            .failure(AppError.NetworkFailed)
       
        expect(self.subject.translatedText.text)
            .toEventually(equal("通信に失敗しました"))
    }

    func test_tapTranslateButton_putParseFailedText_whenTranltateServiceWasParseFailure() {
        subject.inputText.text = "jp-text"
        
        subject.translateButton.sendActions(for: .touchUpInside)
        fakeTranslateService.translate_promise
            .failure(AppError.ParseFailed)
        
        expect(self.subject.translatedText.text)
            .toEventually(equal("JSONの解析に失敗しました"))
    }
}
