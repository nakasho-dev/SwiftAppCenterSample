import Foundation
import BrightFutures

@testable import SwiftAppCenterSample

class FakeDefaultHttp: DefaultHttpProtocol {
    var post_promise: Promise<Any, AppError>!
    var post_args: String!
    func post(path: String) -> Future<Any, AppError> {
        post_promise = Promise<Any, AppError>()
        self.post_args = path
        return post_promise.future
    }
}
