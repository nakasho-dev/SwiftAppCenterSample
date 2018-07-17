import Foundation
import BrightFutures

protocol DefaultHttpProtocol {
    func post(path: String) -> Future<Any, AppError>
}

class DefaultHttp: DefaultHttpProtocol {
    func post(path: String) -> Future<Any, AppError> {
        return Promise<Any, AppError>().future
    }
}
