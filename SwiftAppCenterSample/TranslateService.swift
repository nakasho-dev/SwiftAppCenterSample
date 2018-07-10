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
    func translate(text: String) -> Future<String, AppError> {
        return Promise<String, AppError>().future
    }
}
