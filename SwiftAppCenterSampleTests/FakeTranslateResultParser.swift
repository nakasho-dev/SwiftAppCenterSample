import Foundation

@testable import SwiftAppCenterSample

class FakeTranslateResultParser: TranslateResultParserProtocol {
    var parse_result: Result<TranslateResult, AppError>!
    var parse_args: Any!
    func parse(data: Any) -> Result<TranslateResult, AppError> {
        self.parse_args = data
        return parse_result
    }
}
