//  Created by Chris Karani on 21/10/2020.
//

import SmokeHTTP1
import SmokeOperations
import SmokeOperationsHTTP1
import SmokeOperationsHTTP1Server


func topicPostOperation(input: TopicPostRequest,
                        context: ApplicationContext) throws -> TopicsPostResponse {
    let topic = Topic(name: input.name, duration: input.duration)
    context.topicStore.addTopic(topic)
    return TopicsPostResponse(currentTopics: context.topicStore.topics)
}

public struct TopicPostRequest: ValidatableCodable, Equatable {
    public var name: String
    public var duration: Int
    public func validate() throws {
        guard !name.isEmpty else {
            throw SmokeOperationsError.validationError(
                reason: "Name cannot be empty"
            )
        }
        
        guard duration > 0 else {
            throw SmokeOperationsError.validationError(
                reason: "Duration must be positive"
            )
        }
    }
}


extension TopicPostRequest: OperationHTTP1InputProtocol {
    public static func compose(
        queryDecodableProvider: () throws -> TopicPostRequest,
        pathDecodableProvider: () throws -> TopicPostRequest,
        bodyDecodableProvider: () throws -> TopicPostRequest,
        headersDecodableProvider: () throws -> TopicPostRequest) throws -> TopicPostRequest {
        try bodyDecodableProvider()
    }
}
