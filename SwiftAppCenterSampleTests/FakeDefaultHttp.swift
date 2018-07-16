import Foundation
import BrightFutures

@testable import SwiftAppCenterSample

class FakeDefaultHttp: DefaultHttpProtocol {
    var get_promise: Promise<Any, AppError>!
    var get_args: String!
    func get(path: String) -> Future<Any, AppError> {
        get_promise = Promise<Any, AppError>()
        self.get_args = path
        return get_promise.future
    }
}
