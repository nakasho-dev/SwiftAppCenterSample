import Foundation
import BrightFutures
@testable import SwiftAppCenterSample

class FakeTranslateService: TranslateServiceProtocol {
    var translate_promise: Promise<String, AppError>!
    var translate_args: String!
    func translate(text: String) -> Future<String, AppError> {
        translate_promise = Promise<String, AppError>()
        self.translate_args = text
        return translate_promise.future
    }
}
