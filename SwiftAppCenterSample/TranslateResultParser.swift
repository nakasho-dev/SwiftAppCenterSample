import Foundation

protocol TranslateResultParserProtocol {
    func parse(data: Any) -> Result<TranslateResult, AppError>
}

class TranslateResultParser: TranslateResultParserProtocol {
    func parse(data: Any) -> Result<TranslateResult, AppError> {
        return Result.success(TranslateResult())
    }
}
