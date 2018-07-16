import Foundation
import BrightFutures

enum AppError: Error {
    case NetworkFailed
    case ParseFailed
}

protocol TranslateServiceProtocol {
    func translate(text: String) -> Future<String, AppError>
}

class TranslateService: TranslateServiceProtocol {
    
    init(
        http: DefaultHttpProtocol = DefaultHttp(),
        parser: TranslateResultParserProtocol = TranslateResultParser()
        ) {
        
    }
    
    func translate(text: String) -> Future<String, AppError> {
        return Promise<String, AppError>().future
    }
}
