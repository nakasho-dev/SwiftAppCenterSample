import Foundation
import BrightFutures

protocol DefaultHttpProtocol {
    func get(path: String) -> Future<Any, AppError>
}

class DefaultHttp: DefaultHttpProtocol {
    func get(path: String) -> Future<Any, AppError> {
        return Promise<Any, AppError>().future
    }
}
